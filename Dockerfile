FROM node:4.4
COPY app.js .
COPY package.json .
RUN npm install
EXPOSE 8080
CMD [ "npm", "start" ]