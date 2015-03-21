#!/bin/bash

# Sample script used for microservice deployment

[[ -z $DEBUG ]] || set -o xtrace

log() {
    echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*"
}

err() {
    log "$@" >&2
}

usage() {
    echo "usage: $( basename $0 ) groupId artifactId version nexusUrl"
    exit 1
}

DEPLOY_DIR="${RD_OPTION_DEPLOYDIR:-/srv/deploy}"
CONFIG_FOLDER="${RD_OPTION_CONFIGFOLDER:-/srv/properties}"
APP_ENV="${RD_OPTION_APPENV:-prod}"

GROUP_ID="${RD_OPTION_GROUPID:-$1}"
ARTIFACT_ID="${RD_OPTION_ARTIFACTID:-$2}"
VERSION="${RD_OPTION_VERSION:-$3}"
NEXUS_URL="${RD_OPTION_NEXUSURL:-$4}"

JAVA_OPTS="-Dspring.profiles.active=prod"

export APP_ENV CONFIG_FOLDER

if [[ -z "${GROUP_ID}" ]]; then
    err "Missing groupID"
    usage
fi

if [[ -z "${ARTIFACT_ID}" ]]; then
    err "Missing artifactId"
    usage
fi

if [[ -z "${VERSION}" ]]; then
    err "Missing version"
    usage
fi

if [[ -z "${NEXUS_URL}" ]]; then
    err "Missing nexusUrl"
    usage
fi

if [[ ! -d "${CONFIG_FOLDER}/.git" ]]; then
	err "CONFIG_FOLDER should be git repo"
	exit 1
fi

log "Updating properties repository..."
cd "${CONFIG_FOLDER}" && ( git fetch && git reset --hard origin/master )

ARTIFACT_URL="${NEXUS_URL}/${GROUP_ID//.//}/${ARTIFACT_ID}/${VERSION}/${ARTIFACT_ID}-${VERSION}.jar"

APP_DIR="${DEPLOY_DIR}/${ARTIFACT_ID}"
JAR_FILE="${APP_DIR}/${ARTIFACT_ID}.jar"

mkdir -p "${APP_DIR}"

log "Downloading artifact..."
wget "${ARTIFACT_URL}" -O "${JAR_FILE}"

# start microservice
if [[ -f "${APP_DIR}/${ARTIFACT_ID}.pid" ]]; then
	PID="$( cat "${APP_DIR}/${ARTIFACT_ID}.pid" )"
	log "Killing ${PID}..."
	if ! kill -9 "${PID}" ; then
		echo "No process killed"
	fi
fi

log "Starting ${JAR_FILE}"
cd "${APP_DIR}"
exec nohup java ${JAVA_OPTS} -jar "${JAR_FILE}" </dev/null &>/dev/null &
echo $! > "${ARTIFACT_ID}.pid"
