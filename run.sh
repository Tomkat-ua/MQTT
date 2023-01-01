img=eclipse-mosquitto
container=MQTT
docker pull $img

echo "container STOP:"
 docker container stop $container
echo "container RM:"
 docker container rm $container

docker run -dt -p 1883:1883 \
    --net net_18  --ip 172.18.0.2 \
    --restart=always \
    --name=$container \
    -e TZ=Europe/Kiev \
    -v mosquitto_conf:/mosquitto/config \
    -v mosquitto_data:/mosquitto/data \
    -v mosquitto_log:/mosquitto/log \
    $img

#-p 9001:9001 \
#--net net_18  --ip 172.18.0.2 \
#    --name=MQTT \
#    -v /mosquitto/data \
#    -v /mosquitto/log  \
#     -v mosquitto.conf:/mosquitto/config/mosquitto.conf \
#docker run -it -p 1883:1883 -p 9001:9001 -v mosquitto.conf:/mosquitto/config/mosquitto.conf -v /mosquitto/data -v /mosquitto/log eclipse-mosquitto