# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl.lock
pkgname=python-flufl-lock
pkgver=8.2.0
pkgrel=1
pkgdesc="NFS-safe file locking with timeouts for POSIX systems for Python"
arch=(any)
url="https://gitlab.com/warsaw/flufl.lock"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
  python-psutil
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-sybil
)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('e81208aee2e620528291630836a235d41ab1d16482cf29976e85058b139cb5729053ed958791ecf56c7505b54f96e5d74e1f414725335bc96b7930379c9fe539')
b2sums=('6223e4806a3c5d329370f866031a06e004c431e1eb33617df9e4d185231c30e6b8ca58db82bb19eb648ab2130d1ff13b0c3ce0a14f9402aea051de2d5ad74f5f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="src:$PYTHONPATH"
  pytest -vv -c /dev/null
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
