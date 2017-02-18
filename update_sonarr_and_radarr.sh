#!/bin/sh
infoId=$1
sonarrAPIkey=$"API Key"
radarrAPIkey=$"API Key"

# ------------- Sonarr ----------------
seriesId=$(curl -s http://localhost:8989/api/series -H 'X-Api-Key: $sonarrAPIkey' --compressed | jq -s '.[]| .[] | select(.tvdbId=='$infoId') | .id ')

curl -s  http://localhost:8989/api/command -H 'X-Api-Key: $sonarrAPIkey' --data-binary '{ "name": "rescanSeries", "seriesId" : "'$seriesId'" }'

# ------------- Radarr -----------------
movieId=$(curl -s http://localhost:7878/api/movie -H 'X-Api-Key: $radarrAPIkey' --compressed | jq -s '.[]| .[] | select(.tmdbId=='$infoId') | .id ')

curl -s  http://localhost:7878/api/command -H 'X-Api-Key: $radarrAPIkey' --data-binary '{ "name": "RescanMovie", "movieId" : "'$movieId'" }'
