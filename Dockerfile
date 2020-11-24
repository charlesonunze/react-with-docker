# Build Stage
FROM node:12-alpine as build_stage

WORKDIR /react-app

COPY package.json .

RUN yarn install

COPY . .

RUN yarn run build

# Run Stage
FROM nginx

COPY --from=build_stage /react-app/build /usr/share/nginx/html