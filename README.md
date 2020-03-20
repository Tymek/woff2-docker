# scrlk/woff2
https://hub.docker.com/repository/docker/scrlk/woff2

Dockerized [google/woff2](https://github.com/google/woff2) font converter

Precompiled
- `woff2_compress`
- `woff2_decompress`
- `woff2_info`

installed in `/usr/bin/`.

---

As a bonus I included `wget`, `zip` and a script for generating variable fonts from Google Fonts. Source in `/usr/bin/ggfont`. No warranty for this part! Example use case: 
``` sh
docker run scrlk/woff2 sh -c "ggfont Roboto%20Slab" > roboto-slab.woff2
docker run scrlk/woff2 sh -c "ggfont Spartan" > spartan.woff2
````
