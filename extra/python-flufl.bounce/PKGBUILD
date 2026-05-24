# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-flufl.bounce
_name="${pkgname#python-}"
pkgver=5.0
pkgrel=1
pkgdesc="Email bounce detectors"
arch=(any)
url="https://gitlab.com/warsaw/flufl.bounce"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
)
makedepends=(
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-sybil
)
provides=(python-flufl-bounce)
replaces=(python-flufl-bounce)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('9ff6afd043c1abad05acb3bafa65fbeee86a06a32a738979775fe38b01ad8792073754bd865f0007c96f3d7b91eb43de554b9dec5c04bbee0903b972b67eb36b')
b2sums=('51865ee46f4486dba4653aed5b7676fe8870aac53f05769e67893a9861e292f62aafd173aec18324fbb74fdbf9261baba78cb9b68d52e57e2b54351af3204c44')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )

  cd $_name-$pkgver
  PYTHONPATH="$PWD/src:$PYTHONPATH" pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
