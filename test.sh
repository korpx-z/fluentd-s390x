set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** testing docker run - fluentd  *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW is fluentd listening/running?: $ANSI_RESET"

docker volume create fluentvol
docker run -d -p 24224:24224 -p 24224:24224/udp -v fluentvol:/fluentd/log --name some-flu fluentd
docker logs some-flu | grep 'fluentd worker is now running worker=0'

echo -e "\n $ANSI_GREEN *** TEST COMPLETED SUCESSFULLY *** $ANSI_RESET \n"
