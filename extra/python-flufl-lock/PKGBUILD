# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl.lock
pkgname=python-flufl-lock
pkgver=9.0.0
pkgrel=2
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
sha512sums=('1b623139fdb0fd7508e82a0705964d8f8f968cdfe59690422925946b4699d476f07ce788a3faf9d9f6dfa89a1ba81a416ddbd018a37cce67fc460c456da8b4ea')
b2sums=('e8511e1b88da6f7f3a02c8775e5fa2ebc46063fdfeb3649ccf916133ddcf58081ba931261add2fb2c6c62cfdd89c1c0c2978bf48065e4ce0fae5431ec952ab8e')

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
