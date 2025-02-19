#!/usr/bin/with-contenv bash
SMA_PATH="/usr/local/sma"

echo "************ install packages ************" && \
apk add -U --update --no-cache \
  flac \
  opus-tools \
  jq \
  git \
  wget \
  mkvtoolnix \
  python3-dev \
  libc-dev \
  py3-pip \
  gcc \
  ffmpeg \
  yt-dlp && \
echo "************ install python packages ************" && \
pip install --upgrade --no-cache-dir -U yq && \
echo "************ setup SMA ************" && \
echo "************ setup directory ************" && \
mkdir -p ${SMA_PATH} && \
echo "************ download repo ************" && \
git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git ${SMA_PATH} && \
mkdir -p ${SMA_PATH}/config && \
echo "************ create logging file ************" && \
mkdir -p ${SMA_PATH}/config && \
touch ${SMA_PATH}/config/sma.log && \
chgrp users ${SMA_PATH}/config/sma.log && \
chmod g+w ${SMA_PATH}/config/sma.log && \
echo "************ install pip dependencies ************" && \
python3 -m pip install --upgrade pip && \	
pip3 install -r ${SMA_PATH}/setup/requirements.txt && \
echo "************ install recyclarr ************" && \
mkdir -p /recyclarr && \
wget "https://github.com/recyclarr/recyclarr/releases/latest/download/recyclarr-linux-musl-x64.tar.xz" -O "/recyclarr/recyclarr.tar.xz" && \
tar -xf /recyclarr/recyclarr.tar.xz -C /recyclarr &>/dev/null && \
chmod 777 /recyclarr/recyclarr
apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/community dotnet7-runtime

mkdir -p /custom-services.d
echo "Download QueueCleaner service..."
curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/universal/services/QueueCleaner -o /custom-services.d/QueueCleaner
echo "Done"

echo "Download AutoConfig service..."
curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/radarr/AutoConfig.service -o /custom-services.d/AutoConfig
echo "Done"

echo "Download AutoExtras service..."
curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/radarr/AutoExtras.service -o /custom-services.d/AutoExtras
echo "Done"

echo "Download Recyclarr service..."
curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/universal/services/Recycalarr -o /custom-services.d/Recyclarr
echo "Done"

mkdir -p /config/extended
echo "Download Naming script..."
curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/radarr/naming.json -o /config/extended/naming.json 
echo "Done"

mkdir -p /config/extended
echo "Download PlexNotify script..."
curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/radarr/PlexNotify.bash -o /config/extended/PlexNotify.bash 
echo "Done"

echo "Download Extras script..."
curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/radarr/Extras.bash -o /config/extended/Extras.bash 
echo "Done"

echo "Download SMA config..."
curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/radarr/sma.ini -o /config/extended/sma.ini 
echo "Done"

echo "Download Recyclarr config..."
curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/radarr/recyclarr.yaml -o /config/extended/recyclarr.yaml
echo "Done"

if [ ! -f /config/extended.conf ]; then
	echo "Download Extended config..."
	curl https://raw.githubusercontent.com/RandomNinjaAtk/arr-scripts/main/radarr/extended.conf -o /config/extended.conf
	chmod 777 /config/extended.conf
	echo "Done"
fi


chmod 777 -R /config/extended

exit
