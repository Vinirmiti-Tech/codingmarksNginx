# This file is shell file to deply backend in jenkins

# build the project with maven and create jar file
echo user $USER
# mvn install -Dmaven.test.skip=true
# check if jar file exists
# REM echo
# build the image with latest tag
docker build -t gcr.io/arctic-nectar-209212/backend:latest .
#
#
# For some time version update is skipped
## bump version
#docker run --rm -v "$PWD":/app treeder/bump patch
#version=`cat VERSION`
pwd
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
docker tag gcr.io/arctic-nectar-209212/backend:latest gcr.io/arctic-nectar-209212/backend:$version
# push it
gcloud docker -- push gcr.io/arctic-nectar-209212/backend:latest
gcloud docker -- push gcr.io/arctic-nectar-209212/backend:$version
# to remove all old images : run this command after some time
# docker rmi $(docker images -a -q)
# start elease
ssh vinirmititemp2@webapp <<EOF
pwd
sudo cd dokker-compose/app
sudo docker-compose down
#sudo docker stop backend
#sudo docker rm backend
sudo docker rmi gcr.io/swapasyatemp2/backend:latest
#sudo gcloud docker -- pull gcr.io/swapasyatemp2/backend:latest
sudo docker-compose up -d
#sudo docker run --restart always --name backend -p 8081:443 \
#--network app-network -d  gcr.io/swapasyatemp2/backend:latest
echo Deployed to webapp machine  .....>......>.....
exit
EOF
echo Done !!!
