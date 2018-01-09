FROM nginx
COPY content /usr/share/nginx/html
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/vinirmititech.com /etc/nginx/conf.d/vinirmititech.com
