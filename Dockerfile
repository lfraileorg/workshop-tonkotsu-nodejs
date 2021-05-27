FROM node:alpine AS base

WORKDIR /usr/src/app
ENV PORT=80
EXPOSE 80

FROM node AS build
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

COPY . /usr/src/app

FROM base AS final
WORKDIR /usr/src/app
COPY --from=build /usr/src/app .
CMD [ "npm", "start" ]
