FROM nginx:latest

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration file(s) into the container
COPY ./conf.d/ /etc/nginx/conf.d/