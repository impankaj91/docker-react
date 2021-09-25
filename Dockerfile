FROM node:alpine AS builder
WORKDIR /app
#COPY package.json .
COPY . /app/
RUN npm install
RUN npm run build

#FROM nginx
COPY --from=builder /app/build ./dist/