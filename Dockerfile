FROM node:17.9.0-alpine as builder-app
# Set working directory
WORKDIR /app
# Copy all files
COPY . ./
# install dependencies and build assets
RUN yarn && yarn build

FROM nginx:stable-alpine
# Generate htpasswd for basic http auth
RUN apk add --update --no-cache openssl && echo -n 'firstleaf:' >> /etc/nginx/.htpasswd && \
    openssl passwd -apr1 test >> /etc/nginx/.htpasswd && apk del openssl
# Set working directory
WORKDIR /usr/share/nginx/html
# Remove default nginx default page
RUN rm -rf ./*
# Copy nginx configuration with gzip compression
COPY nginx-conf/nginx.conf /etc/nginx/nginx.conf
# Copy ngnix configuration for basic http auth
COPY nginx-conf/default.conf /etc/nginx/conf.d/default.conf
# Copy assets from builder stage
COPY --from=builder-app /app/build .
CMD ["nginx", "-g", "daemon off;"]