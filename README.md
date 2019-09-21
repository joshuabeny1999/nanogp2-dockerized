# nanogp2-dockerized
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/joshuabeny/nanogp2)  ![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/joshuabeny/nanogp2)  ![Docker Pulls](https://img.shields.io/docker/pulls/joshuabeny/nanogp2) 

Docker Image to run https://github.com/nanostudio-org/nanogallery2 inside an Docker Container.

## What is nanogp2?
<b>[nanogp](https://github.com/nanostudio-org/nanogp2)</b> is a PHP add-on for <b>[nanogallery2](https://github.com/nanostudio-org/nanogallery2)</b> for accessing **Google Photos** content.   
  
Based on the Google Photos API.  
Supported content: albums and photos (not videos).  


# Usage
To start the container just run:

```
$ docker run -d --name nanogp2 \
      -e NANOGP2_CLIENT_ID="your_client_id" \
      -e NANOGP2_CLIENT_SECRET="your_client_secret" \
      -e NANOGP2_MAX_ACCOUNTS=1 \
      -e NANOGP2_ALBUMS_FILTER="sauvergarde, backup, ignore-nanogp2" \
      --link typo3-db:db \
      -p 80:80 \
      joshuabeny/nanogp2
```

As an alternative (recommended) you could use the following docker-compose.yml:

```yaml
version: '3'
services:
    nanogp2:
        image: joshuabeny/nanogp2
        container_name: nanogp2
        restart: always
        volumes:
            - nanogp2_user_data:/var/www/html/admin/users
        expose:
            - 80
        environment:
           NANOGP2_MAX_ACCOUNTS: 1
           # Client ID and client secret can be obtained from the Google API Console.
           NANOGP2_CLIENT_ID: "your_client_id"
           NANOGP2_CLIENT_SECRET: "your_client_secret"
           # ALBUMS_FILTER is used to filter albums out. 
           # Albums with a title containing one of the string will not be displayed.
           NANOGP2_ALBUMS_FILTER: "sauvergarde, backup, ignore-nanogp2"

volumes:
    nanogp2_user_data:
```

Place this file in some folder and then just run:
```
$ docker-compose up -d
```

## How to get client id and client secret and setup nanogp2?
Please check for that the <b>[Documentation of nanogp2](https://github.com/nanostudio-org/nanogp2/blob/master/README.md)</b>

