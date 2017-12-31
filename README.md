# Fork of diameter/rtorrent-rutorrent with configurable volumes.

Multiple processes inside the container managed by supervisord:

* nginx
* php5-fpm
* rtorrent

---

Exposed:

* Web UI ports: 80
* DHT UDP port: 51101
* Incoming connections port: 51102
* Downloads volume: /downloads
* Watch volume: /watch
* Torrent session volume: /session
* rTorrent config volume: /rtorrent
* ruTorrent config volume: /rutorrent
* rtorrent uid and gid: USR_ID and GRP_ID env vars, default is 1000:1000
* php5-fpm memory limit: PHP_MEM env var, default is 256M

---

Example:

$ docker run -dt \
 --name rtorrent-rutorrent \
 -p 8080:80 \
 -p 51101:51101/udp \
 -p 51102:51102 \
 -p 5555:5555 \
 -v ~/incomplete:/incomplete \
 -v ~/complete:/complete \
 -v ~/watch:/watch \
 -v ~/session:/session \
 -v ~/rtorrent:/rtorrent \
 -v ~/rutorrent:/rutorrent \
 zszafran/rtorrent-rutorrent

---

Additional:

Custom .rtorrent.rc

* Downloads start in /incomplete
* Completed downloads are moved to /complete/<rutorrent label>

---

Access web-interface: enter http://your_host_address:8080 in a browser
