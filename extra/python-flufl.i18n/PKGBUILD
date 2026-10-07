# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl.i18n
pkgname=python-flufl.i18n
pkgver=7.0.0
pkgrel=1
pkgdesc="A high level API for internationalization"
arch=(any)
url="https://gitlab.com/warsaw/flufl.i18n"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-sybil
  python-pytest
)
provides=(python-flufl-i18n)
replaces=(python-flufl-i18n)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('e0bff9d0e968a07919a37ce69ec3e4c1e34b0e7e8165126700f0f7a0bcfa6a32ed1ec5e6a0f72e7415fa7c6da9615dc616cb6683d1609840bf885aea473d309e')
b2sums=('14d6156bb17ffccb7e8913607d968e0dac80aa564b36b012310e67c5cc2e619333ddfc3dc76f04d06f19fb54f8aea70c76ef3563370000b51df2a6e3438f96ba')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -o addopts=''
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
