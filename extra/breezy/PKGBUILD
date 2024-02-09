# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Adam Fontenot <adam.m.fontenot@gmail.com>

pkgname=breezy
pkgver=3.3.5
pkgrel=1
pkgdesc='A decentralized revision control system with support for Bazaar and Git file formats'
arch=(x86_64)
url=https://www.breezy-vcs.org/
license=(GPL2)
depends=(
  python-configobj
  python-dulwich
  python-fastbencode
  python-merge3
  python-patiencediff
  python-six
  python-yaml
)
makedepends=(
  cython
  git
  python-build
  python-fastimport
  python-gpgme
  python-installer
  python-packaging
  python-paramiko
  python-setuptools
  python-setuptools-gettext
  python-setuptools-rust
  python-wheel
)
optdepends=(
  'python-fastimport: Fastimport support'
  'python-gpgme: PGP support'
  'python-paramiko: access branches over SFTP'
)
provides=(bzr)
conflicts=(bzr)
replaces=(bzr)
_tag=abe1c92f161581e2c8386bcee0e35457250eca0b
source=(git+https://github.com/breezy-team/breezy.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd breezy
  git describe --tags | sed 's/brz-//; s/-/./g'
}

build() {
  cd breezy
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" breezy/dist/*.whl
  ln -s brz "${pkgdir}"/usr/bin/bzr # backwards compatibility
}

# vim: ts=2 sw=2 et:
