FROM python:3.8-buster

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install -y \
       build-essential python3-dev python3-pip \
       python3-gst-1.0 \
       gir1.2-gstreamer-1.0 \
       gir1.2-gst-plugins-base-1.0 \
       gstreamer1.0-alsa \
       gstreamer1.0-plugins-good \
       gstreamer1.0-plugins-bad \
       gstreamer1.0-plugins-ugly \
       gstreamer1.0-tools \
       gstreamer1.0-libav \
       gstreamer1.0-x \
       libaacs0 \
       gstreamer1.0-gl \
       python3-setuptools \
       python3-wheel \
       wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add - \
    && wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install mopidy mopidy-spotify -y \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip --no-cache-dir install --upgrade \
       mopidy \
       Mopidy-MPD \
       Mopidy-Iris \
       Mopidy-Youtube \
       Mopidy-SoundCloud \
       Mopidy-SomaFM \
       Mopidy-Beets \
       Mopidy-AudioAddict \
       Mopidy-TuneIn \
       youtube-dl
