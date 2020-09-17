# Tinyproxy minimal image

To change configuration, just volume mount a conf file into the container: ```docker run -v my_special_tinyproxy.conf:/etc/tinyproxy/tinyproxy.conf nyvanga/tinyproxy my_special_tinyproxy ```

## Test build image

Run docker-compose: ```docker-compose up --build```