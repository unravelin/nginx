#
# Nginx Dockerfile
#
# Based off https://github.com/dockerfile/nginx
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

# Install our own nginx conf
COPY nginx.conf /etc/nginx/nginx.conf

# Remove the default nginx file
RUN rm -f /etc/nginx/sites-enabled/default

# Define mountable directories.
VOLUME ["/var/log/nginx"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
