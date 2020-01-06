FROM ubuntu:16.04

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y

CMD nginx -g 'daemon off;'
RUN apt-get install curl -y
RUN apt-get install python-software-properties -y
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install nodejs -y
ADD app /home/ubuntu/app

WORKDIR /home/ubuntu/app
RUN npm install
EXPOSE 3000
RUN npm install pm2 -g

RUN npm install
CMD ["node", "seeds/seed.js"]
CMD ["node", "app.js"]
