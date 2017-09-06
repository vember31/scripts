# scripts
Mah SCRIPTS

<b>Filebot.sh:</b> Contains the AMC script called by Deluge.  Contains a reference to update_sonarr_and_radarr.sh in the --def -exec parameter.

<b>Update_sonarr_and_radarr.sh:</b> Contains the script that is responsible for taking FileBot's output and converting {info.id} (which is the tvdb or tmdb ID) into Sonarr or Radarr's internal ID format.  From there it POSTs a command to rescanSeries / rescanMovie for that specific tvdb or tmdb ID.  You MUST have CDH (Completed Download Handling) and Drone Factory disabled on both Sonarr and Radarr.  


The Filebot.sh script should be called by following the instructions on Deluge's website.  Essentially, just put the path to your script in the field for Execute. Obviously, make sure that you both of these scripts are executable, and make sure that you have jq installed.

Subzero79 really helped with the structuring of the jq from his advice here: https://forums.sonarr.tv/t/refreshseries-rescanseries-command/10797
