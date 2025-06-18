# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-rencode
pkgver=1.0.8
pkgrel=1
pkgdesc="A Module similar to bencode from the BitTorrent project"
url="https://github.com/aresch/rencode"
license=('GPL-3')
arch=('x86_64')
depends=('python')
makedepends=('git' 'cython' 'python-build' 'python-installer' 'python-poetry-core' 'python-setuptools')
checkdepends=('python-pytest')
source=("git+https://github.com/aresch/rencode.git#tag=v$pkgver")
sha512sums=('974d3efb1e1f7a54902c3772663a5d122399b2e825592634cc88ba1f1a51ebf97470c368e6891d9e52af8a700a50749d428d273de2c5b21b6334fa456f664443')

prepare() {
  cd rencode
  # build.py seems to be a special name, and it prevents building of a wheel
  mv build.py cython_build.py
  sed -i 's/build.py/cython_build.py/' pyproject.toml
}

build() {
  cd rencode
  python cython_build.py
  python -m build --wheel --no-isolation
}

check() {
  cd rencode
  python -m venv --system-site-packages testenv
  testenv/bin/python -m installer dist/*.whl
  testenv/bin/python -m pytest
}

package() {
  cd rencode
  python -m installer --destdir="$pkgdir" dist/*.whl
}
