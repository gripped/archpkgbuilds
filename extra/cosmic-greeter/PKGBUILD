# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Mark Wagie <mark.wagie@proton.me>

pkgname=cosmic-greeter
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='COSMIC greeter for greetd'
arch=(x86_64)
url=https://github.com/pop-os/cosmic-greeter
license=(GPL-3.0-only)
groups=(cosmic)
depends=(
  cosmic-comp
  gcc-libs
  glibc
  greetd
  libxkbcommon
  pam
  wayland
)
makedepends=(
  cargo
  clang
  git
  git-lfs
  just
  lld
)
source=(
  git+https://github.com/pop-os/cosmic-greeter.git#tag=epoch-${pkgver}
  cosmic-greeter-display-manager.patch
  cosmic-greeter-lto.patch
)
b2sums=('716132cd7ecb77f02106f42d729492e9a73b970ea03ca7bcc8b89a1cd28906a2e174ef0cb3cd4be0e16a4a7e391056b5e698e6f74583c5fac425d9e717e4632c'
        '8b5c32a991e31cf102b1b07e06d37e979f19106b82e8cab7dc8df81789ab6b24587605aa3387254057732a268368c4074f92461f6f5125bc1cba4e62e18cef27'
        '89ca262c95713e773662fb81e379bc2b63d2c93072b909f8f1eaaafee5289359fd729a476eb66568f893986a53e9c689dccfc4aeeeef62cb736cff466c463f7d')

prepare() {
  cd cosmic-greeter
  git lfs install --local
  git remote add network-origin ${url}
  git lfs fetch network-origin
  git lfs checkout
  # revert pam config for now
  git revert -n ef1253aa2393666bb2a0b0132b722f51ec7ebbf3
  cargo fetch --locked
  patch -Np1 -i ../cosmic-greeter-display-manager.patch
  patch -Np1 -i ../cosmic-greeter-lto.patch
}

build() {
  cd cosmic-greeter
  RUSTFLAGS+=" -C link-arg=-fuse-ld=lld"
  just build-release --frozen
}

package() {
  cd cosmic-greeter
  just rootdir="${pkgdir}" install
  install -Dm 644 cosmic-greeter.toml -t "${pkgdir}"/etc/greetd/
  install -Dm 644 debian/cosmic-greeter{.service,-daemon.service} -t "${pkgdir}"/usr/lib/systemd/system/
}

# vim: ts=2 sw=2 et:
