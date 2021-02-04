"""SSH notifier with Google Python API.

https://developers.google.com/calendar/quickstart/python
https://developers.google.com/calendar/create-events

Move credentials.json in ~/.
"""

from __future__ import print_function

import argparse
import datetime
import os.path
import pathlib
import pickle

import pytz
from google.auth.transport.requests import Request
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build

# If modifying these scopes, delete the file token.pickle.
SCOPES = ["https://www.googleapis.com/auth/calendar"]

# Local timezone
TIMEZONE = "Europe/Paris"

# Home directory
HOME = str(pathlib.Path.home())

# Token path
token_path = "{}/ssh_notifier/token.pickle".format(HOME)

# Credentials path
creds_path = "{}/ssh_notifier/credentials.json".format(HOME)


def main(hours):
    """Create event.

    Args:
        hours (float): number of hours during which the server will go to
            sleep.
    """
    # Get credentials
    # ------------------------------------------

    creds = None

    # The file token.pickle stores the user's access and refresh tokens, and is
    # created automatically when the authorization flow completes for the first
    # time.
    if os.path.exists(token_path):
        with open(token_path, "rb") as token:
            creds = pickle.load(token)

    # # If there are no (valid) credentials available, let the user log in.
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())

        else:
            flow = InstalledAppFlow.from_client_secrets_file(
                creds_path, SCOPES)
            creds = flow.run_local_server(port=0)

        # Save the credentials for the next run
        with open(token_path, "wb") as token:
            pickle.dump(creds, token)

    # Compute times
    # ------------------------------------------

    # Current date
    date_time_now = datetime.datetime.today()

    # Awakening date
    date_time_awakening_0 = date_time_now + datetime.timedelta(hours=hours)
    date_time_awakening_1 = date_time_now + datetime.timedelta(hours=hours + 1)

    # Get UTC offset
    utc_offset = datetime.datetime.now(pytz.timezone(TIMEZONE)).strftime("%z")
    utc_offset_str = utc_offset[:3] + ":" + utc_offset[3:]

    # Get string for the Google Calendar Event
    api_str_0 = date_time_awakening_0.strftime("%Y-%m-%dT%H:%M:00")
    api_str_1 = date_time_awakening_1.strftime("%Y-%m-%dT%H:%M:00")

    # Add UTC offset (with colon)
    api_str_0 = api_str_0 + utc_offset_str
    api_str_1 = api_str_1 + utc_offset_str

    # Create event configuration
    # ------------------------------------------

    event = {
        "summary": "ssh_wakes_up",
        "location": "",
        "description": "",
        "start": {
            "dateTime": api_str_0,
            "timeZone": TIMEZONE,
        },
        "end": {
            "dateTime": api_str_1,
            "timeZone": TIMEZONE,
        },
        "reminders": {
            "useDefault": True,
        },
    }

    # Create the event
    # ------------------------------------------

    service = build("calendar", "v3", credentials=creds)
    event = service.events().insert(calendarId="primary", body=event).execute()
    print("Event created: %s" % (event.get("htmlLink")))


if __name__ == "__main__":
    # Initialize parser
    parser = argparse.ArgumentParser(
        description="SSH notifier with Google Calendar API.")

    # Add hours argument
    parser.add_argument("--hours",
                        type=float,
                        default=None,
                        help="Sleep hours.")

    # Parse args
    args = parser.parse_args()

    # Launch script
    main(args.hours)
