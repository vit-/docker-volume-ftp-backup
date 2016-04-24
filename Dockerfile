FROM debian:jessie
MAINTAINER Vitalii Vokhmin <vitaliy.vokhmin@gmail.com>

ENV VOLUME_MOUNT_POINT '/data'
ENV ARCHIVE_NAME_PREFIX 'volume_container'
ENV FTP_PATH ''
ENV FTP_USER 'anonymous'
ENV FTP_PASSWORD ''

RUN apt-get update && apt-get install -y curl bzip2 && apt-get clean && rm -rf /var/lib/apt/lists

ADD upload_archive.sh /bin/upload_archive.sh
RUN chmod +x /bin/upload_archive.sh
CMD [ "/bin/upload_archive.sh" ]
