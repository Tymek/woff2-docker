FROM alpine

RUN apk add --no-cache git make g++ wget unzip

RUN git clone --recursive https://github.com/google/woff2.git --depth 1 \
  && (cd woff2 && make clean all) \
  && cp woff2/woff2_* /usr/bin/ \
  && rm -r ./woff2/

RUN echo -e "\
#!/bin/sh
wget https://fonts.google.com/download?family=\$1 -O /tmp/archive.zip >&2\n\
unzip /tmp/archive.zip -d /tmp/font >&2\n\
ls /tmp/font \
| grep VariableFont \
| xargs printf "/tmp/font/%s" \
| xargs woff2_compress \
| tee /dev/stderr \
| sed 's/.*=> //' \
| xargs cat\n\
rm -rf /tmp/*\
" > /usr/bin/ggfont \
&& chmod +x /usr/bin/ggfont
