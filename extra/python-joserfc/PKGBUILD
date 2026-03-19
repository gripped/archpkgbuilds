# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-joserfc
pkgver=1.6.3
pkgrel=1
pkgdesc='Implementations of JOSE RFCs in Python'
arch=(any)
url='https://github.com/authlib/joserfc'
license=('BSD-3-Clause')
depends=(
  python
  python-cryptography
)
makedepends=(
  git
  python-build
  python-installer
  python-pycryptodome
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=(
  'python-pycryptodome: for draft RFCs'
)
# HACK: commit=$pkgver works during fetching sources as upstream repo uses
# non-annotated tags, and we want to PGP verify commits, not tags
source=("git+$url?signed#commit=$pkgver")
b2sums=('dbe3a69e8d00df1aa76fa9abf891a60063c78849656adc9a3e5b3b3498a3e4878dff97965427b7f20612a7297b3b50922a6d9e34a3f6af5ce127ca1ebd1c3fbb')
validpgpkeys=('72F8E895A70CEBDF4F2ADFE07E55E3E0118B2B4C') # Hsiaoming (UJET) <lepture@ujet.co>

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  pytest
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
