# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-atpublic
_name="${pkgname#python-}"
_upstream=public
pkgver=8.0.1
pkgrel=1
pkgdesc="@public decorator for Python"
arch=(any)
url="https://gitlab.com/flufl/public"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-sybil
)
source=($url/-/archive/$_name@$pkgver/$_upstream-$_name@$pkgver.tar.gz)
sha512sums=('edca91de453a2858aa845803d35e6a31d94ff68337c7b839d3511d17cb140b484cbe586e35f90e77da9c0feecca3d66996ee2d3b747fefbf1057c75d36048d38')
b2sums=('8d8ebb277e35c3f0b630f852c11bb9d1e034323ca42e923de8b87095a3a1ecb1c37404e84522e1ee8f649df8810d4518437d4bf19076ea5888058f8df6946b8b')

build() {
  cd $_upstream-$_name@$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_upstream-$_name@$pkgver
  PYTHONPATH="$PWD/packages/$_name/src" pytest -vv
}

package() {
  cd $_upstream-$_name@$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
