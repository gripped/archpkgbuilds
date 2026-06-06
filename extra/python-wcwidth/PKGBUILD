# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname=python-wcwidth
pkgver=0.8.0
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
sha512sums=('604c531c7e65aa70f22e2db8319750abd8f641f04bb7e737f3ba40855c2770585d67554e453c82e8b28850c9fc8057322bd2203e0ce1cd49c9ccf41e8699d818')
b2sums=('a365489dc020c70a899cd715d2bd3e98ba1a31aa8f4617cb07857baa92044f221366e19f38cf5b8c700c6b4decfa55818a3f684875bb19a4b963a0e80b01e766')

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
