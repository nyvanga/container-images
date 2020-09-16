# General purpose Multitool

The entry point is bash.

Run on docker: ```docker run -it --rm --name multitool nyvanga/multitool```

Run on docker with docker-compose: ```docker-compose up -d --build && docker-compose exec test_build_multitool bash```

Run on kubernetes: ```kubectl run -it --rm --image nyvanga/multitool multitool```

## Test build

First run: ```docker-compose up -d --build --no-cache```

Then to access the running container: ```docker-compose exec test_build_multitool bash```