# Multitool for Terraform

Terraform installed in `/usr/local/bin/terraform`.

Run on docker: ```docker run -it --rm --name multitool-tf nyvanga/multitool-tf```

The image has tags for major versions, aswell as stable and latest, go to [docker hub](https://hub.docker.com/r/nyvanga/multitool-tf/tags) to see more.

## Test build

First run: ```docker-compose up -d --build --no-cache```

Then to access the container: ```docker-compose exec -- test_build_multitool_tf bash```
