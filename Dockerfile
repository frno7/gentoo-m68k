FROM gentoo/portage:latest as portage
FROM gentoo/stage3:latest as gentoo

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

WORKDIR /srv

COPY configs configs
COPY scripts scripts

RUN scripts/main

WORKDIR /

CMD ["/bin/bash"]
