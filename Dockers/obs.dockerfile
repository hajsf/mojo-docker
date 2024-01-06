FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm obs-studio && \
    pacman -Scc --noconfirm

CMD ["obs"]
