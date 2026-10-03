# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname=python-wcwidth
pkgver=0.9.2
pkgrel=1
pkgdesc='Python library that measures the width of unicode strings rendered to a terminal'
arch=(x86_64)
url='https://github.com/jquast/wcwidth'
license=(MIT)
depends=(glibc python)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('2a597ff93b159602277014d264cae6a591a114591b5f5ed4adc39485a2b01bc4e44c38d358d300a064f78fbbff26ab24c36e0a974904f22549baf801585c6c50')
b2sums=('080b808e30cc0f3f33c1b42e21d5b2159ab56ec6c834ea04c81c3d71257a0c5045e65d149af3b6b108374d9e845325c64e826261c423838cff990f2d0da7088b')

build() {
  cd "$pkgname"

  CIBUILDWHEEL=1 python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  rm -v tox.ini

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  WCWIDTH_PYTHON=1 pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
