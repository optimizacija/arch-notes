# Docker

# Build for this machine

```
docker build -t <user>/<name>:<tag> .

# log into DockerHub
docker login

# push local image to DockerHub
docker push <user>/<name>:<tag>
```


## Building for multiple architectures

Building for other architectures requires emulators, install them via

```
docker run --privileged --rm tonistiigi/binfmt --install arm64,riscv64,arm\n
```

Build image for multiple architectures/platforms:

```
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t <user>/<name>:<tag> .
```

For any issues during the installation phase, check out these docs:
https://github.com/tonistiigi/binfmt#installing-emulators

### IMPORTANT

Enable qemu everytime docker is restarted!
```
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
```
