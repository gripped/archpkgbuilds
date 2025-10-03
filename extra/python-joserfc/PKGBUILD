# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-joserfc
pkgver=1.3.4
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
sha256sums=('cb3db30f84bcb07a8e568542037f041f329b1169a64e936537b4b5439cd1d335')
validpgpkeys=(
  '72F8E895A70CEBDF4F2ADFE07E55E3E0118B2B4C' # Hsiaoming (UJET) <lepture@ujet.co>
)

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
