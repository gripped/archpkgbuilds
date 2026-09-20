# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname=python-wcwidth
pkgver=0.8.4
pkgrel=1
pkgdesc='Python library that measures the width of unicode strings rendered to a terminal'
arch=(any)
url='https://github.com/jquast/wcwidth'
license=(MIT)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('c678e7746882ec839c8802ada8b45d50179795225492e2f3b1c41338268e9eb6fdddc96e0962aa3eed6698b0c0a12d76eaa916dc6ba99877dbb72a81cef30323')
b2sums=('f58f485c3e2b92332bc18cd202f5b1b6f942c593d3eb914e6655c783c3b111d9db9a6b8cf45131db2e35cd3d601e8d73dbddd40b130d945d2e39153d7506b9f0')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  rm -v tox.ini

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
