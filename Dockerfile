FROM node:4.4
EXPOSE 80
COPY server.js .
CMD node server.js

