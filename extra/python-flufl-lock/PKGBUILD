# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl.lock
pkgname=python-flufl-lock
pkgver=9.2.0
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
sha512sums=('e8e0834138674188d53b2ed2ff947c987300e92c4e879828ba56442cda306d2943b2d95646b1fa29f3c25b5ce3669d52355b37e1799e911152dc06dd7369d4d4')
b2sums=('7445123c01503657984317357d8c491a9f177fbac0bb8eebc99597092494f675f10e023953581859f45568ecb1d49099d3b3b64b9febd978dca3d8ab04609c21')

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
