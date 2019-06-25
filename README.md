# smokeping
Smokeping

Smokeping with FPING, DNS, Curl & SSH probes

## Composer example
```
version: '3.7'
services:
  smokeping:
    image: me1299/smokeping:v0.1
    container_name: smokeping
    volumes:
        - 'smokeping:/data'
    ports:
      - '80:80'
    environment:
      - PUID=1000
      - PGID=997
      - TZ=Europe/Amsterdam
      - SMOKEPING_URL=http://smokeping.domain.com
      - OWNER=Yourname
      - OWNER_EMAIL=user@domain.com
      - TITLE=My smokeping
      - STEP=300
      - PINGS=20
    restart: unless-stopped      
```
