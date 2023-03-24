"""Simple Ray parallelization benchmark."""

import time

import ray

# Maximum number of workers to test
NUM_WORKERS = range(25)


@ray.remote
def main(x):
    """Compute."""
    # Wait for 1 second
    time.sleep(1)
    return x * x


if __name__ == "__main__":
    # Initialize Ray on 1 node (e.g., personal computer)
    ray.init()

    # Initialize Ray on a cluster (special script required)
    # ray.init(address="auto")

    # Log
    out = ""

    # Test different number of workers
    for num_w in NUM_WORKERS:

        # Monitor total time
        time_start = time.time()

        # Launch script
        results = [main.remote(i) for i in range(num_w)]
        results = ray.get(results)

        # Gather log
        total_time = time.time() - time_start
        log = "num_workers[{:02d}]---time[{:02.2F}]".format(num_w, total_time)

        # Print and save log
        print(log)
        out += log
        out += "\n"

    # Save to file
    with open("benchmark.txt", "w") as f:
        f.write(out)

    # Shutdown Ray (if parallelization)
    ray.shutdown()
