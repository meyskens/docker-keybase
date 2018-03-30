FROM meyskens/desktop-base

RUN wget https://prerelease.keybase.io/keybase_amd64.deb &&\
    sudo dpkg -i keybase_amd64.deb; \
    sudo apt-get -y install -f &&\
    rm -f keybase_amd64.deb

# Patch to run in foreground
RUN sed -i "s/\/opt\/keybase\/Keybase.*\&$/\/opt\/keybase\/Keybase/g" /usr/bin/run_keybase

RUN mkdir /home/user && chown -R user /home/user
USER user

CMD run_keybase
