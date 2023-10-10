FROM alpine:3.18
RUN	apk update && apk upgrade && apk add --no-cache nginx
COPY /requirements/nginx/conf/nginx.conf /etc/nginx/http.d/nginx.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
