# docker sabnzbd
This is a Dockerfile to set up "SABnzbd" - (http://sabnzbd.org/)
Build from docker file
```
git clone https://github.com/QNimbus/docker-sabnzbd.git
cd docker-sabnzbd
docker build --rm --no-cache -t qnimbus/docker-sabnzbd .
```

docker run -d -h *your_host_name* -v /*your_config_location*:/config -v /*your_videos_location*:/data -p 8080:8080 -p 9090:9090 --restart=always sabnzbd

e.g.

docker run --name sabnzbd -d -h docker.home.i-135.com -v /mnt/download/sabnzbd/config:/config -v /mnt/download/sabnzbd/data:/data -p 0.0.0.0:8080:8080 -p 0.0.0.0:9090:9090 --restart=always qnimbus/docker-sabnzbd
