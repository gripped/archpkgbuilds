# Maintainer: David Runge <dvzrv@archlinux.org>

_name=fire
pkgname=python-fire
pkgver=0.7.0
pkgrel=2
pkgdesc="A library for automatically generating command line interfaces"
arch=(any)
url="https://github.com/google/python-fire"
license=(Apache-2.0)
depends=(
  python
  python-termcolor
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-levenshtein
  python-pytest
)
source=(
  https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz
)
sha256sums=('961550f07936eaf65ad1dc8360f2b2bf8408fad46abbfa4d2a3794f8d2a95cdf')
b2sums=('a1cc759466ac78bae82b4ed50ce3915fe0e45308fb96e7b4c76fc0e04cc5ae950351fc736f8790d79d1cbd441240d41eebf9130fd57a1f7cc46f5b40404dbe5c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  export PYTHONPATH="build:$PYTHONPATH"
  pytest -v
}

package() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  # remove test files: https://github.com/google/python-fire/issues/422
  rm -frv "$pkgdir/$_site_packages/$_name/"{testutils,*_test}.py
}
