cd /usr/local/git/webchat-backend
git pull -u origin master:master
mvn install
cp ./webchat-backend-message/target/webchat-backend-msg-1.0.1.jar ../../apps/webchat-backend
cd ../../apps/webchat-backend
./stop.sh
./start.sh
cd /usr/local/git/webchat
git pull -u origin master:master
npm install
npm run build
rm -rf /usr/share/nginx/html/*
cp -r ./dist/* /usr/share/nginx/html
nginx -s reload

