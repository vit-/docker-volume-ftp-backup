# volume-ftp-backup
Docker image for simple volumes backup/restore over FTP.

# Description
Image with a simple script that archives the data from the Docker volume
and uploads the archive to an FTP server.

Uses user provided archive name prefix + unix timestamp as suffix for the filename.
I. e. `volume_container-123456789.tar.bz2`.

# Usage

## Backup
Image accepts following environment variables:
- `VOLUME_MOUNT_POINT` - path where volume is mounted. Default is `/data`
- `ARCHIVE_NAME_PREFIX` - prefix for archive file name. Default is `volume_container`
- `FTP_PATH` - full path to FTP folder. I. e. `ftp://example.com/path/to/storage/`
- `FTP_USER` - FTP username. Default is `anonymous`
- `FTP_PASSWORD` - FTP password for authentication

### Example
```bash
docker run --rm -v my_shiny_volume:/data -e ARCHIVE_NAME_PREFIX='my_shiny_backup' -e FTP_PATH='ftp://example.com/backups/shiny_folder/' -e FTP_USER='user' -e FTP_PASSWORD='secret' vit1/volume-ftp-backup
```

## Restore
- `VOLUME_MOUNT_POINT` - path where volume is mounted. Default is `/data`
- `FTP_PATH` - full path to archive. I. e. `ftp://example.com/path/to/storage/volume_container_1234.tar.bz2`
- `FTP_USER` - FTP username. Default is `anonymous`
- `FTP_PASSWORD` - FTP password for authentication

### Example
```bash
docker run --rm -v my_shiny_volume:/data -e -e FTP_PATH='ftp://example.com/backups/shiny_folder/volume_container_1234.tar.bz2' -e FTP_USER='user' -e FTP_PASSWORD='secret' vit1/volume-ftp-backup restore.sh
```
