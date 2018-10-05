#/bin/bash
if [ "$(curl 172.28.33.10:8080)" == 'This is server 2' ]; then
        echo "=("
        exit 1;
fi