# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Martin Kemp <mdkemp@elys.com>

pkgname=ethtool
epoch=1
pkgver=7.0
pkgrel=1
pkgdesc="Utility for controlling network drivers and hardware"
arch=('x86_64')
url="https://www.kernel.org/pub/software/network/ethtool/"
license=('GPL-2.0-or-later')
depends=('glibc' 'libmnl')
makedepends=('git')
source=("git+https://git.kernel.org/pub/scm/network/ethtool/ethtool.git#tag=v${pkgver}")
sha256sums=('0bcdf4a9cc2188a553deae441a44c7e91e862fd88bd97383601e2f33482571ad')
validpgpkeys=(CE4A4D080F0D304F23B9EBDD972D5BF4DC613806  # John W. Linville <linville@kernel.org>
              D2CB120AB45957B721CD9596F4554567B91DE934) # Michal Kubecek <mkubecek@suse.cz>

prepare() {
  cd "${pkgname}"
  autoreconf -fi
}

build() {
  cd "${pkgname}"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin
  make
}

check() {
  cd "${pkgname}"
  make check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
