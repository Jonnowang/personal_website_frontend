FROM docker.io/nginx:alpine AS runtime

# Copy files
COPY ./dist /usr/share/nginx/html
