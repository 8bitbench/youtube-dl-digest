FROM ubuntu:16.04
# Update cache and install base packages


RUN apt-get update ; apt-get install -y \
  curl \
  cron

#To get updated youtube-dl releases, you have to rebuild the base docker image. 
#The following is a hack but works.
RUN echo "Edit this line to force a Docker rebuild to include a youtube-dl update"
RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

COPY files/etc/cron.d/youtubedl /etc/cron.d/

RUN addgroup media --gid=1050 \
    && useradd -ms /bin/bash media --uid=1050 --gid=1050

CMD ["/toolbox/app/bin/script.sh"]
