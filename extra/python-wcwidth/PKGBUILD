# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname=python-wcwidth
pkgver=0.3.1
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
sha512sums=('32dce81273a11958fccbddcee4214b2bd6aeabc3e3f1c24677978bd5577ed96cac4b5f41b13e10723e195134b45687e4aacb8d9ec9ec41ca08df6fac9b886db4')
b2sums=('57398a338e52fb4e4f50c1e70079ac21d887a37507d1f6f10398317d06a8c7787109947263def99f2a636809fb53c80fa51af8b3cbfac45018933501e3fefebe')

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
