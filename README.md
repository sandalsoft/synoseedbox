# Fork of zszafran/rtorrent-rutorrent which is a fork of diameter/rtorrent-rutorrent with configurable volumes.

Changes I made from zszafran/rtorrent-rutorrent:

* Upgraded to ruTorrent v3.8
* Changed compelted torrents directory from /complete to /data
* Changed rutorrent Autotools watch interval from 5min to 3sec
* Changed /incomplete directory to /in_progress

Multiple processes inside the container managed by supervisord:

* nginx
* php5-fpm
* rtorrent

---

Exposed:

* Web UI ports: 80
* DHT UDP port: 51101
* Incoming connections port: 51102
* Downloads volume: /data
* Watch volume: /watch
* Torrent session volume: /session
* rTorrent config volume: /rtorrent
* ruTorrent config volume: /rutorrent
* rtorrent uid and gid: USR_ID and GRP_ID env vars, default is 1000:1000
* php5-fpm memory limit: PHP_MEM env var, default is 256M

---

Example:

$ docker run -dt \
 --name sandalsoft-synoseedbox \
 -p 8080:80 \
 -p 51101:51101/udp \
 -p 51102:51102 \
 -p 5555:5555 \
 -v ~/in_progress:/in_progress \
 -v ~/data:/data \
 -v ~/watch:/watch \
 -v ~/session:/session \
 -v ~/rtorrent:/rtorrent \
 -v ~/rutorrent:/rutorrent \
 sandalsoft-synoseedbox

---

Additional:

Custom .rtorrent.rc

* Downloads start in /in_progress
* Completed downloads are moved to /data/<rutorrent label>

---

Access web-interface: enter http://your_host_address:8080 in a browser
