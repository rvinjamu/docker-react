FROM node:alpine as buildingphase
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx
COPY --from=buildingphase /app/build /usr/share/nginx/html



