FROM node:14.20.0-alpine as builder
COPY . /app
WORKDIR /app
RUN npm install
RUN npm run build 


FROM nginx:1.18.0-alpine
EXPOSE 80

COPY --from=builder /app/dist/ang-dock /usr/share/nginx/html


# /home/tspl/Desktop/docker-angular/angdock