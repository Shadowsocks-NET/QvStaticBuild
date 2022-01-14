# Qv2ray Static Build

Build statically-linked Qv2ray binaries for Arch Linux!

The nightly workflow runs every Monday, Wednesday, Friday to build statically-linked binaries from the latest commit.

## AUR Package

[![AUR badge for qv2ray-static-nightly-bin](https://img.shields.io/aur/version/qv2ray-static-nightly-bin?label=qv2ray-static-nightly-bin)](https://aur.archlinux.org/packages/qv2ray-static-nightly-bin/)

## Why static linking?

All previous blockers have been resolved. You can now use [![AUR badge for qv2ray-git](https://img.shields.io/aur/version/qv2ray-git?label=qv2ray-git)](https://aur.archlinux.org/packages/qv2ray-git/).

This project will keep running for those who don't want to build Qv2ray locally.

- ~~Qt 6.2 is still in beta.~~
- ~~Using system uvw is blocked by skypjack/uvw#246.~~
- ~~Building Qv2rayBase with uvw supplied by the submodules causes uvw to be included in the package.~~

## License

[GPLv3](LICENSE)
