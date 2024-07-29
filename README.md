# neardi-cross

This project mainly solves the docker image generation of Rockchip, NVIDIA and HiSilicon.

## Care

- Ensure all command lines are indented with a tab, not spaces.
- The TARGETS and UBUNTU VERSIONS variables list the architectures and Ubuntu versions you want to build.
- The all target builds all architectures by default.
- The amd64 and arm64 targets build all specified Ubuntu versions for the respective architectures.
- Each amd64 and arm64 version target (amd64-18.04, amd64-20.04, etc.) builds the corresponding Docker image.
- The generic targets (amd64/% and arm64/%) handle building specific versions passed as variables.

## Build cross-build enviroment.

- Build all amd64 images:

```bash
make amd64
```

- Build all arm64 images (Now not support, because arm64 directory is empty):

```bash
make arm64
```

- Build specific amd64 image:

```bash
make amd64/20.04
```

Build specific arm64 image (Now not support, because arm64 directory is empty):

```bash
make arm64/22.04
```

## Example

```bash
neardi@ubuntu20:~/neardi-cross$ sudo make amd64
Building amd64 environment for 18.04...
sha256:1bebec6d1c79a9c26b7c309bb7953429789366d91d42b3441f794ca79e2bef35
Building amd64 environment for 20.04...
sha256:e3cfd8327073929089f4583c15bd47fa70fee3d0f848a1a9fb0d942806c0849e
Building amd64 environment for 22.04...
sha256:421fc02613cea5f91abe28d24ba51ff7cfade1bb8fa4e09625a082a396c34aee
```
## Result

```bash
neardi@ubuntu20:~/neardi-cross$ sudo docker images
REPOSITORY     TAG           IMAGE ID       CREATED          SIZE
ubuntu         20.04-amd64   e3cfd8327073   17 minutes ago   1.71GB
ubuntu         22.04-amd64   421fc02613ce   6 hours ago      1.57GB
ubuntu         18.04-amd64   1bebec6d1c79   3 days ago       2.05GB
```
