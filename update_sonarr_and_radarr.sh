#!/bin/sh
infoId=$1 #this is being passed in by the filebot.sh script.  It is the TVDB ID (if a tv show) or the TMDB (if a movie). 
#sonarrAPIkey=$"API Key"
#radarrAPIkey=$"API Key"


# Below, we must first get 'seriesId' or 'movieId', which are the Sonarr/Radarr internal IDs from the TVDB or TMDB ID passed in by filebot.
# The second line is responsible for calling the API to manually update the specific series/movie.
# ------------- Sonarr ----------------
seriesId=$(curl -s http://localhost:8989/api/series -H 'X-Api-Key: [Sonarr API Key]' --compressed | jq -s '.[]| .[] | select(.tvdbId=='$infoId') | .id ')

curl -s  http://localhost:8989/api/command -H 'X-Api-Key: [Sonarr API Key]' --data-binary '{ "name": "rescanSeries", "seriesId" : "'$seriesId'" }'

# ------------- Radarr -----------------
movieId=$(curl -s http://localhost:7878/api/movie -H 'X-Api-Key: [Radarr API Key]' --compressed | jq -s '.[]| .[] | select(.tmdbId=='$infoId') | .id ')

curl -s  http://localhost:7878/api/command -H 'X-Api-Key: [Radarr API Key]' --data-binary '{ "name": "RescanMovie", "movieId" : "'$movieId'" }'
