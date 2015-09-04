# docker sabnzbd
This is a Dockerfile to set up "SABnzbd" - (http://sabnzbd.org/)
Build from docker file
```
git clone https://github.com/QNimbus/docker-sabnzbd.git
cd docker-sabnzbd
docker build --rm --no-cache -t qnimbus/docker-sabnzbd .
```

To start the container :

```
docker run --name sabnzbd -d -h ${HOSTNAME} -v /your/config/location:/config -v /your/download/location:/data -v /etc/localtime:/etc/localtime:ro -p 8080:8080 -p 9090:9090 --restart=always qnimbus/docker-sabnzbd sabnzbd
```
