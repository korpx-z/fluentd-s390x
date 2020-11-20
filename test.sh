set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** testing docker run - fluentd  *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW is fluentd listening/running?: $ANSI_RESET"

docker run --name Mule -d -p 8081:7777  quay.io/ibmz/mule:3.9.1 mule start
docker logs Mule 

echo -e "\n $ANSI_GREEN *** TEST COMPLETED SUCESSFULLY *** $ANSI_RESET \n"
