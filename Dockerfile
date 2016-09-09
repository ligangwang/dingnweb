FROM node:4.4
COPY app.js .
COPY rubikscube rubikscube/
COPY package.json .
RUN npm install
EXPOSE 8080
CMD [ "npm", "start" ]