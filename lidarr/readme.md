  # Requirements
Container: https://docs.linuxserver.io/images/docker-lidarr<br>

# Installation/setup
1. Add 2 volumes to your container <br>
  `/custom-services.d` and `/custom-cont-init.d` (do not map to the same local folder...) <br> 
  Docker Run Example: <br>
  `-v /path/to/preferred/local/folder-01:/custom-services.d` <br>
  `-v /path/to/preferred/local/folder-02:/custom-cont-init.d`
3. Download the [script_init.bash](https://github.com/RandomNinjaAtk/arr-scripts/blob/main/lidarr/scripts_init.bash) and place it into the following folder: `/custom-cont-init.d`
4. Start your container and wait for the application to load
5. Optional: Customize the configuration by modifying the following file `/config/extended.conf`
6. Restart the container

# Updating
Updating is a bit more combersum. To update, do the following:
1. Download/update your local `/config/extended.conf` file with the latest options from: [extended.conf](https://github.com/RandomNinjaAtk/arr-scripts/blob/main/lidarr/extended.conf)
2. Restart the container, wait for it to fully load the application.
3. Restart the container again, for the new scripts to activate.

This configuration does its best to update everything automatically, but with how the core system is designed, the new scripts will not take affect until a second restart is completed because the container copies/uses the previous versions of the script for execution on the first restart.

# Features
<table>
  <tr>
    <td><img src="https://github.com/RandomNinjaAtk/docker-lidarr-extended/raw/main/.github/lidarr.png" width="150"></td>
    <td><img src="https://github.com/RandomNinjaAtk/docker-lidarr-extended/raw/main/.github/plus.png" width="75"></td>
    <td><img src="https://github.com/RandomNinjaAtk/docker-lidarr-extended/raw/main/.github/music.png" width="150"></td>
    <td><img src="https://github.com/RandomNinjaAtk/docker-lidarr-extended/raw/main/.github/plus.png" width="75"></td>
    <td><img src="https://github.com/RandomNinjaAtk/docker-lidarr-extended/raw/main/.github/video.png" width="150"></td>
  </tr>
 </table>
 
* Downloading **Music** using online sources for use in popular applications (Plex/Kodi/Emby/Jellyfin): 
  * Completely automated
  * Searches for downloads based on Lidarr's album missing & cutoff list
  * Downloads using a third party download client automatically
  * FLAC (lossless) / MP3 (320/128) / AAC (320/96) Download Quality
  * Can convert Downloaded FLAC files to preferred audio format and bitrate before import into Lidarr
  * Notifies Lidarr to automatically import downloaded files
  * Music is properly tagged and includes coverart before Lidarr Receives them
  * Can pre-match and tag files using Beets
  * Can add Replaygain tags to tracks
  * Can add top artists from online services
  * Can add artists related to your artists in your existing Library
  * Can notify Plex application to scan the individual artist folder after successful import, thus increasing the speed of Plex scanning and reducing overhead
* Downloading **Music Videos** using online sources for use in popular applications (Plex/Kodi/Emby/Jellyfin):
  * Completely automated
  * Searches Lidarr Artists (musicbrainz) video recordings for videos to download
  * Saves videos in MKV format by default
  * Downloads using Highest available quality for both audio and video
  * Saves thumbnail of video locally for Plex/Kodi/Jellyfin/Emby usage
  * Embed subtitles if available matching desired language
  * Automatically Add Featured Music Video Artists to Lidarr
  * Writes metadata into Kodi/Jellyfin/Emby compliant NFO file
    * Tagged Data includes
      * Title (musicbrainz)
      * Year (upload year/release year)
      * Artist (Lidarr)
      * Thumbnail Image (service thumbnail image)
      * Artist Genere Tags (Lidarr)
  * Embeds metadata into Music Video file
    * Tagged Data includes
      * Title (musicbrainz)
      * Year (upload year/release year)
      * Artist (Lidarr)
      * Thumbnail Image (service thumbnail image)
      * Artist Genere Tags (Lidarr)
* Queue Cleaner Script
  * Automatically removes downloads that have a "warning" or "failed" status that will not auto-import into Lidarr, which enables Lidarr to automatically re-search for the album

For more details, visit the [Wiki](https://github.com/RandomNinjaAtk/arr-scripts/wiki)

### Audio & Video (Plex Example)
![](https://github.com/RandomNinjaAtk/docker-lidarr-extended/raw/main/.github/plex.png)

### Video Example (Kodi)
![](https://github.com/RandomNinjaAtk/docker-lidarr-extended/raw/main/.github/kodi-music-videos.png)


# Credits
- [LinuxServer.io Team](https://github.com/linuxserver/docker-lidarr)
- [Lidarr](https://lidarr.audio/)
- [Beets](https://beets.io/)
- [Deemix download client](https://deemix.app/)
- [Tidal-Media-Downloader client](https://github.com/yaronzz/Tidal-Media-Downloader)
- [r128gain](https://github.com/desbma/r128gain)
- [Algorithm Implementation/Strings/Levenshtein distance](https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance)
- [ffmpeg](https://ffmpeg.org/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [SMA Conversion/Tagging Automation Script](https://github.com/mdhiggins/sickbeard_mp4_automator)
- [Freyr](https://github.com/miraclx/freyr-js)
