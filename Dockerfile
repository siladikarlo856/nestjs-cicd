FROM node:18.16.0-alpine3.17
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY ./package.json ./
COPY ./tsconfig.build.json ./
COPY ./tsconfig.json ./
RUN npm install
COPY src/ .
RUN npm run build
EXPOSE 3000
CMD [ "npm", "run", "start:prod"]