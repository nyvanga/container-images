# Speedtest minimal image

The entrypoint.sh tries to accept the license and gdpr, but doesn't always work...

Otherwise it just runs the speedtest-cli once.

Very useful for running speedtest on specific VLAN's.

Run once on docker: ```docker run --rm nyvanga/speedtest```

# Test build

Run docker-compose: ```docker-compose up --build```