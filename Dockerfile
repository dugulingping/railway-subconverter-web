FROM tindy2013/subconverter:latest

COPY files/ /base/
# set entry
WORKDIR /base

RUN wget https://github.com/dugulingping/subwebM/releases/latest/download/subwebM-release.tar.gz && \
    tar -zxvf subwebM-release.tar.gz && \
    rm -rf subwebM-release.tar.gz

EXPOSE 25500
CMD subconverter
