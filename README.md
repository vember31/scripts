# scripts
Mah SCRIPTS

<b>Filebot.sh:</b> Contains the AMC script called by Deluge.  Contains a reference to update_sonarr_and_radarr.sh in the --def -exec parameter.

<b>rtorrent-postprocess.sh:</b> Contains the AMC script called by rTorrent.  Contains a reference to update_sonarr_and_radarr.sh in the --def -exec parameter.  Using this today, once I found out how great of a client rTorrent is.

<b>Update_sonarr_and_radarr.sh:</b> Contains the script that is responsible for taking FileBot's output and converting {info.id} (which is the tvdb or tmdb ID) into Sonarr or Radarr's internal ID format.  From there it POSTs a command to rescanSeries / rescanMovie for that specific tvdb or tmdb ID.  You MUST have CDH (Completed Download Handling) and Drone Factory disabled on both Sonarr and Radarr.  

<b>rtorrent.rc:</b> A backup / reference to the rtorrent.rc configuration file that lives in ~/

<b>external.conf:</b> Additional configuration for lighttpd.conf when using in conjunction with Pi-Hole.  If you're not using pihole, the code inside of this file can be put directly in /etc/lighttpd/lighttpd.conf.

<b>jackett_reinstall.sh:</b> A shell script, to be run from /opt/, that will reinstall the latest stable release of Jackett.  This was written due to challenges with jackett's auto-update feature, that occasionally cause jackett to fail.


The Filebot.sh script should be called by following the instructions on Deluge's website.  Essentially, just put the path to your script in the field for Execute. Obviously, make sure that you both of these scripts are executable, and make sure that you have jq installed.

Subzero79 really helped with the structuring of the jq from his advice here: https://forums.sonarr.tv/t/refreshseries-rescanseries-command/10797
