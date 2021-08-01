# Qv2ray Static Build

Build statically-linked Qv2ray binaries for Arch Linux!

The nightly workflow runs every 24 hours to build statically-linked binaries from the latest commit.

## AUR Package

[![AUR badge for qv2ray-static-bin-nightly](https://img.shields.io/aur/version/qv2ray-static-bin-nightly?label=qv2ray-static-bin-nightly)](https://aur.archlinux.org/packages/qv2ray-static-bin-nightly/)

## Why static linking?

- Qt 6.2 is still in beta.
- Using system uvw is blocked by skypjack/uvw#246.
- Building Qv2rayBase with uvw supplied by the submodules causes uvw to be included in the package.

## License

[GPLv3](LICENSE)
