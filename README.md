# Ubuntu docker container

Linux workspace for builds, tests, and embedded/ARM cross-development.

## Note

Set git line endings before building on Windows:

```bash
git config --global core.autocrlf false
```

Otherwise trailing `^M` characters can break the Docker image build.

## Toolchains included

| Target | Compilers | Notes |
| --- | --- | --- |
| Host (x86_64) | `gcc`, `g++`, `gdb` | Plus CMake, Ninja, GoogleTest |
| ARM bare-metal | `arm-none-eabi-gcc` | Cortex-M/R, newlib, `gdb-multiarch`, OpenOCD, stlink, dfu-util |
| Linux AArch64 | `aarch64-linux-gnu-gcc` | Userspace cross-compile |
| Linux ARMHF | `arm-linux-gnueabihf-gcc` | ARMv7 hard-float userspace |
| Emulation | `qemu-system-arm`, `qemu-user-static` | Full-system and user-mode |

Quick checks inside the container:

```bash
arm-none-eabi-gcc --version
aarch64-linux-gnu-gcc --version
arm-linux-gnueabihf-gcc --version
gdb-multiarch --version
openocd --version
```

## How to use

### Build image

```bash
docker build -t your_image_tag .
```

### Run with SSH port forwarding

```bash
docker run -id --name container_name -p 22:22 your_image_tag
```

### Connect

```bash
docker exec -it container_name /bin/bash
```

Or SSH (`root` / `root` — for local lab use only):

```bash
ssh root@localhost -p 22
```
