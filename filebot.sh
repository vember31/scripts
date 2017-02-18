#!/bin/sh
ARG_ID="$1"
ARG_NAME="$2"
ARG_PATH="$3"
pushbulletAPI=$"insert pushbullet API here"
kodiClients=$"192.168.1.124,192.168.1.184" #the two pcs - comma delimited
outputDir=$"/home/(user)/Documents/external_hdd/Organized_Media" #ensure no backslash @ the end!

#----------Script--------#
paplay /home/(user)/Downloads/Turn.wav #play a sound to signify the download is complete

#call filebot w/update sonarr/radarr script within
# {info.id} returns the tvdb or tmdb, depending on whether it's a TV show or a movie
filebot -script fn:amc --output $outputDir --action duplicate --conflict skip -non-strict --log-file amc.log --def "exec=/home/(user)/Documents/update_sonarr_and_radarr.sh \"{info.id}\"" excludeList=.excludes unsorted=y music=y artwork=y xbmc=$kodiClients pushbullet=$pushbulletAPI "ut_dir=$ARG_PATH/$ARG_NAME" "ut_kind=multi" "ut_title=$ARG_NAME"


#old script for updating sickrage
#filebot -script fn:amc --output "/home/duke/Documents/external_hdd/Organized_Media" --action duplicate --conflict skip -non-strict --log-file amc.log --def exec="curl 'http://192.168.1.89:8081/api/c455975a5cc76741d0f8a616eadac0a8?cmd=show.refresh&tvdbid={info.id}'" excludeList=.excludes unsorted=y music=y artwork=y xbmc=192.168.1.184,192.168.1.124 "ut_dir=$TORRENT_PATH/$TORRENT_NAME" "ut_kind=multi" "ut_title=$TORRENT_NAME"
