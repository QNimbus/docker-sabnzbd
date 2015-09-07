#!/usr/bin/env bash

# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [--help] [-h HOSTNAME] [-n NAME] [-c CONFIG_VOLUME] [-d DATA_VOLUME]

Runs the qnimbus/sabnzbd container
 
    -n, --name   		Set name of the container (default is 'sabnzbd')
    -h, --hostname		Set the hostname of the container (default is docker host)
    -d, --data-volume		Set the path of the data volume to be used by container
    -c, --config-volume		Set the path of the config volume to be used by container
    --help                      Display this help and exit
EOF
}

CURRENT_DIR=`pwd`
DOCKER_HOSTNAME=${HOSTNAME-sabznbd}

while :; do
    case $1 in
        -h|-\?|--help)   # Call a "show_help" function to display a synopsis, then exit.
            show_help
            exit
            ;;
        -n|--name)       # Takes an option argument, ensuring it has been specified.
            if [ -n "$2" ]; then
                NAME="--name ${2}"
                shift 2
                continue
            else
                printf 'ERROR: "--name, -n : requires a non-empty option argument.\n' >&2
                exit 1
            fi
            ;;
        -h|--hostname)       # Takes an option argument, ensuring it has been specified.
            if [ -n "$2" ]; then
                DOCKER_HOSTNAME=$2
                shift 2
                continue
            else
                printf 'ERROR: "--hostname, -h : requires a non-empty option argument.\n' >&2
                exit 1
            fi
            ;;
        -c|--config-volume)       # Takes an option argument, ensuring it has been specified.
            if [ -n "$2" ]; then
                CONFIG_VOLUME=$2
                shift 2
                continue
            else
                printf 'ERROR: "--config-volume, -c : requires a non-empty option argument.\n' >&2
                exit 1
            fi
            ;;
        -d|--data-volume)       # Takes an option argument, ensuring it has been specified.
            if [ -n "$2" ]; then
                DATA_VOLUME=$2
                shift 2
                continue
            else
                printf 'ERROR: "--data-volume, -d : requires a non-empty option argument.\n' >&2
                exit 1
            fi
            ;;
        --)              # End of all options.
            shift
            break
            ;;
        -?*)
            printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
            ;;
        *)               # Default case: If no more options then break out of the loop.
            break
    esac

    shift
done

# Start and run the container

docker run -d -h ${DOCKER_HOSTNAME} ${NAME-} -v ${CONFIG_VOLUME:-${CURRENT_DIR}/config}:/config -v ${DATA_VOLUME:-${CURRENT_DIR}/data}:/data -v /etc/localtime:/etc/localtime:ro -p 8080:8080 -p 9090:9090 qnimbus/docker-sabnzbd
