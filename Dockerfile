FROM nginx
RUN apt update && apt-get install -y locales
 
# Locale
RUN sed -i -e \
  's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
   && locale-gen
 
ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:ru
ENV LC_LANG ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8
 
RUN  mkdir /var/www
RUN  rm -f /etc/nginx/conf.d/default.conf
COPY site.conf  /etc/nginx/conf.d/
COPY landing/. /var/www/
RUN  chown nginx:nginx -R /var/www/
