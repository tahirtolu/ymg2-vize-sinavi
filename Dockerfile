FROM nginx:latest

COPY ./usr/share/nginx/html/index.html

EXPOSE 80