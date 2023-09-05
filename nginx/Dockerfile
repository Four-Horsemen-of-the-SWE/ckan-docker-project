FROM nginx:stable-alpine

ENV NGINX_DIR=/etc/nginx

COPY setup/nginx.conf ${NGINX_DIR}/nginx.conf
COPY setup/index.html /usr/share/nginx/html/index.html
COPY setup/default.conf ${NGINX_DIR}/conf.d/

# Make a backend_upload folder (for datasets)
RUN mkdir -p /usr/share/nginx/html/uploads/datasets-thumbnail

# Make a backend_upload folder (for article)
RUN mkdir -p /usr/share/nginx/html/uploads/articles-thumbnail

# Adjust the source and destination paths for the datasets-thumbnail folder
COPY datasets-thumbnail /usr/share/nginx/html/uploads/datasets-thumbnail

# Adjust the source and destination paths for the articles-thumbnail folder
COPY articles-thumbnail /usr/share/nginx/html/uploads/articles-thumbnail

RUN mkdir -p ${NGINX_DIR}/certs
COPY setup/ckan-local.* ${NGINX_DIR}/certs/

EXPOSE 81