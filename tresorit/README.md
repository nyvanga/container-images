# Tresorit image

## Tresorit
[Tresorit](https://tresorit.com) on Debian slim.

Profile is stored in a volume: ```/home/tresorit/Profiles```

Launch container: ```docker run -d --name tresorit nyvanga/tresorit```

Then login: ```docker exec -it tresorit tresorit-cli login --email <your Tresorit account email> --password-on-stdin```
Type your password, and possibly a 2-factor challenge.

Check that Tresorit is running: ```docker exec -t tresorit tresorit-cli status```

Check your Tresors: ```docker exec -t tresorit tresorit-cli tresors```

Setup a sync by volume mounting into the container: ```docker run -d --name tresorit -v /some/path:/some/path nyvanga/tresorit```

Then setup a sync on Tresorit: ```docker exec -t tresorit tresorit-cli sync --start Some_Tresor --path /some/path```

Check what's going on with the sync: ```docker exec -t tresorit tresorit-cli transfers```

## docker-compose

Example docker-compose.yaml:
```
version: '3'

services:
  tresorit:
    image: nyvanga/tresorit
    container_name: tresorit
    volumes:
      - /my-profile-folder:/home/tersorit/Profiles
      - /some/path:/some/path
      - /some/other_path:/some/other_path
    environment:
      - TZ=Europe/Copenhagen
```
Login: ```docker-compose exec tresorit tresorit-cli login --email <your Tresorit account email> --password-on-stdin```

Check your Tresors: ```docker-compose exec tresorit tresorit-cli tresors```

Setup a sync on Tresorit:
```
docker-compose exec tresorit tresorit-cli sync --start Some_Tresor --path /some/path
docker-compose exec tresorit tresorit-cli sync --start Some_Other_Tresor --path /some/other_path
```

Check what's going on with the sync: ```docker-compose exec tresorit tresorit-cli transfers```

## Test build

Run: ```docker-compose up --build```
