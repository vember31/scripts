#!/bin/sh
ARG_ID="$1"
ARG_NAME="$2"
ARG_PATH="$3"

#----------Script--------#
#paplay /home/$username/Downloads/Turn.wav #play a sound to signify the download is complete; turn off if you have no spaekers

#call filebot w/update sonarr/radarr script within
# {info.id} returns the tvdb or tmdb, depending on whether it's a TV show or a movie
filebot -script fn:amc --output "/home/[username]/Organized_Media --action duplicate --conflict skip -non-strict --log-file amc.log --def seriesFormat="TV Shows/{n}/Season {s.pad(2)}/{n} - {s00e00} - {t}  [{source}-{vf}]" movieFormat="Movies/{ny}/{ny} [{source}-{vf}]" "exec=/home/[username]/Documents/update_sonarr_and_radarr.sh \"{info.id}\"" excludeList=.excludes unsorted=y music=y artwork=y xbmc=[Kodi Clients or delete] pushbullet=[Pushbullet Token] plex=[Plex IP]:[Plex Auth Token] "ut_dir=$ARG_PATH/$ARG_NAME" "ut_kind=multi" "ut_title=$ARG_NAME"

# Notes
#seriesFormat="TV Shows/{n}/Season {s.pad(2)}/{n} - {s00e00} - {t}  [{source}-{vf}]"
# Ex: /TV Shows/Season 05/Suits - S05E05 - Whatever [HDTV-720p]
#movieFormat="Movies/{ny}/{ny} [{source}-{vf}]"
# Ex: /Movies/Avatar (2009)/Avatar (2009) [Bluray-1080p]
