#echo Build Start
#ssh vinirmititemp2@webapp << EOF
##cd ./library-web
#git pull
#echo pulled everything ....
#sudo su
#sudo rm -rf /var/lib/docker/volumes/frontend-data/_data/*
#echo removed old pages
#sudo ls /var/lib/docker/volumes/frontend-data/_data
#echo started to cpoy new pages
#sudo cp -a /home/vinirmititemp2/library-web/. /var/lib/docker/volumes/frontend-data/_data/.
#echo copied new pages
#exit
#exit
#EOF
#echo Done !!







# build the project with maven and create jar file
echo user $USER
pwd

npm install
ng build --prod

# build the image with latest tag
docker build -t gcr.io/arctic-nectar-209212/frontend:latest .
#
#
# For some time version update is skipped
## bump version
#docker run --rm -v "$PWD":/app treeder/bump patch
#version=`cat VERSION`
version=0.0.1
#echo "version: $version"
## tag it
##git config --global user.email "vinirmititech@gmail.com"
##git config --global user.name "vinirmiti"
#git add -A
#git commit -m "version $version"
#git tag -a "$version" -m "version $version"
#git push origin HEAD:master
## git push
#git push --tags
#
#
# tag the image
docker tag gcr.io/arctic-nectar-209212/frontend:latest gcr.io/arctic-nectar-209212/frontend:$version
# push it
gcloud docker -- push gcr.io/arctic-nectar-209212/frontend:latest
gcloud docker -- push gcr.io/arctic-nectar-209212/frontend:$version
# to remove all old images : run this command after some time
# docker rmi $(docker images -a -q)
# start elease
ssh vinirmititemp2@webapp <<EOF
pwd

sudo cd docker-compose/app
sudo docker-compose down
sudo docker rmi gcr.io/swapasyatemp2/frontend:latest

sudo docker-compose up -d

echo Deployed to webapp machine  .....>......>.....
exit
EOF
echo Done !!!
