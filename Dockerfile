FROM alpine:3.4
MAINTAINER Vitalii Vokhmin <vitaliy.vokhmin@gmail.com>

RUN apk add --no-cache curl bzip2
COPY backup.sh /bin/backup.sh
COPY restore.sh /bin/restore.sh
RUN chmod +x /bin/backup.sh /bin/restore.sh

ENV VOLUME_MOUNT_POINT '/data'
ENV ARCHIVE_NAME_PREFIX 'volume_container'
ENV FTP_PATH ''
ENV FTP_USER 'anonymous'
ENV FTP_PASSWORD ''

CMD [ "/bin/backup.sh" ]
