# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Author: Achilleas Koutsou <achilleas@koutsou.net>

pkgname=rpm-sequoia
pkgver=1.10.1
pkgrel=1
pkgdesc="An OpenPGP backend for rpm using Sequoia PGP"
arch=('x86_64')
url='https://github.com/rpm-software-management/rpm-sequoia'
license=('LGPL-2.0-or-later')
depends=(nettle)
makedepends=(cargo rust clang pkg-config)

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/rpm-software-management/rpm-sequoia/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('539705430ab061358c943d1a2f8140057756877a6acb074fd6fd7c4698f9f59f')

prepare() {
  cd "rpm-sequoia-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"

}

build() {
  cd "rpm-sequoia-${pkgver}"

  cargo build --frozen --release
}

check() {
  cd "rpm-sequoia-${pkgver}"

  PREFIX=/usr LIBDIR="\${prefix}/lib" cargo build --frozen --release
  cargo test --release
}

package() {
  cd "rpm-sequoia-${pkgver}"

  install -Dm644 target/release/librpm_sequoia.so "${pkgdir}/usr/lib/librpm_sequoia.so.1"

  # unversioned symlink
  ln -s librpm_sequoia.so.1 "${pkgdir}/usr/lib/librpm_sequoia.so"

  # install pkg-config
  install -Dm644 target/release/rpm-sequoia.pc "${pkgdir}/usr/lib/pkgconfig/rpm-sequoia.pc"
}
