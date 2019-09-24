FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80  #ITS FOR ELASTIC BEANSTALK, WONT DO ANYTHING FOR OUR MACHINE
COPY --from=builder /app/build /usr/share/nginx/html
