# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl.lock
pkgname=python-flufl-lock
pkgver=9.1.0
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
sha512sums=('7cc8edec103505a01a126c1abe5daac9f17f4e7e67df23cd426181e4ec5c9610d0b6f7a73edba9e192e05ddd48d94cb170b81288559a843e45088ea3d4d55927')
b2sums=('3d68a09fead73cf2c768f0a512a51cddcc2eedee6573daf20821620679e11e56fd78bab0f94a68cfe5ebd4aded202776af681e3ebccc995e193b993720d40099')

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
