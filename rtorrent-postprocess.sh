#!/bin/sh -xu

# Input Parameters
ARG_PATH="$1"
ARG_NAME="$2"
ARG_LABEL="$3"

# Configuration
CONFIG_OUTPUT="$HOME/Media"

#filebot -script fn:amc --output "$CONFIG_OUTPUT" --action duplicate --conflict$

filebot -script fn:amc --output "/home/duke/Organized_Media" --action duplicate --conflict skip -non-strict --log-file amc.log --def seriesFormat="TV Shows/{n}/Season {s.pad(2)}/{n} - {s00e00} - {t}  [{source}-{vf}]"  movieFormat="Movies/{ny}/{ny} [{source}-{vf}]" "exec=/home/[user]/Documents/updaate_sonarr_and_radarr.sh \"{info.id}\"" excludeList=.excludes unsorted=y music=y artwork=y pushbullet=[PUSHBULLET API KEY] plex=localhost:[PLEX KEY] ut_dir="$ARG_PATH" ut_kind="multi" ut_title="$ARG_NAME" ut_label="$ARG_LABEL" &
