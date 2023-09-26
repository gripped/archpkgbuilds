# Maintainer: David Runge <dvzrv@archlinux.org>

_name=cookiecutter
pkgname=python-cookiecutter
pkgver=2.3.1
pkgrel=1
pkgdesc="A command-line utility that creates projects from project templates"
arch=(any)
url="https://github.com/cookiecutter/cookiecutter"
license=(BSD)
depends=(
  python
  python-arrow
  python-binaryornot
  python-click
  python-jinja
  python-pyyaml
  python-requests
  python-rich
  python-slugify
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  git
  python-freezegun
  python-pytest
  python-pytest-mock
)
source=($url/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('aa93a40dd82f579ebef894a5ad55798e623809804b6d8322f6fa5787e86bd98b79ea81d16ad3e7bf67570f2449f20d4241e13673fc106e58b2111a10c712bb35')
b2sums=('0f2122b0c9c46ece8da03d4431d4ace3bcb2541e91d050af940eac7cd617ed0643db4533c2f4d6709de0e0746417cff0a67d63e490f9c5aaeaff9cf239b97189')

prepare() {
  # we do not care about code coverage in pytest runs
  sed -e '/addopts/d' -i $_name-$pkgver/setup.cfg
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
