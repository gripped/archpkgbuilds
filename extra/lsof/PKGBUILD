# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>
# Contributor: Hendrik Meyer <archlinux@t4cc0.re>

pkgname=lsof
pkgver=4.99.5
pkgrel=1
pkgdesc='Lists open files for running Unix processes'
url='https://github.com/lsof-org/lsof'
arch=('x86_64')
license=('custom')
depends=(
  glibc
  libtirpc
)
makedepends=(
  groff
)
source=(${url}/archive/refs/tags/${pkgver}.tar.gz
        reproducible-builds.patch)
sha256sums=('3c591556c665196e0aada5982ff43c75e248187bad78bb1368d8fb9c1c527e6e'
            'fdc62c85a7ace604aec5248d0543e6789c0042bc8be1ae0717561e088c85eb08')
b2sums=('998ce85c7a0e742e6f7696d00ee3b6bb8aa6b6e5c30d5c76ac1fc74ea7d8062d73da4de54f433147b74ef4a6d6ac168f70ee68773c82269e07ec3f90bd9b8a8c'
        'f42255d02b1b56692e1b28a282b9490901882a0c4b3991ae39e8fcfc62a4eb8183db370b26e67e700334d1141dcc3e725d9ee8a1981f9108c992c88fd4089732')

prepare() {
  cd ${pkgname}-${pkgver}
  # https://github.com/lsof-org/lsof/issues/310
  patch -Np1 -i ../reproducible-builds.patch
}

build() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
  ./configure \
    --prefix=/usr \
    --enable-security \
    --enable-no-sock-security \
    --with-libtirpc
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
