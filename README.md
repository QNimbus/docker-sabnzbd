# docker sabnzbd
This is a Dockerfile to set up "SABnzbd" - (http://sabnzbd.org/)
Build from docker file
```
git clone https://github.com/QNimbus/docker-sabnzbd.git
cd docker-sabnzbd
docker build --rm --no-cache -t qnimbus/docker-sabnzbd .
```

docker run -d -h *your_host_name* -v /*your_config_location*:/config -v /*your_videos_location*:/data -v /etc/localtime:/etc/localtime:ro -p 8080:8080 -p 9090:9090 --restart=always qnimbus/docker-sabnzbd sabnzbd
