FROM nginx:1.17

# Remove default nginx configuration.
RUN rm /etc/nginx/conf.d/default.conf

# Add nginx configuration for symfony.
COPY default.conf /etc/nginx/conf.d/default.conf
