FROM nginx:latest

WORKDIR /app

COPY . /usr/share/nginx/html

CMD [ "nginx" ,"-g" , "daemon off;" ]