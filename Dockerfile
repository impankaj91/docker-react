FROM node:alpine AS builder
WORKDIR /app
#COPY package.json .
COPY . /app/
RUN npm install
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html