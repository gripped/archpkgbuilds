# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname=python-wcwidth
pkgver=0.8.1
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
sha512sums=('04d7e4f6246e55370fc2e8d7febd305e8ae1707cbba9d2b425e120ae1e5b4e552b3aca4c7c802f6a09e3d85db624f7edea0443b53bb4fc471236053dc0c20a28')
b2sums=('dccefda9aee5f7ef34b7c6c318278307dca5e5902831a92068c4d03824d9e27a0341562afa4b2bcdbac243484effc7c95713c2d56cd4c5ed93cac692741f8b29')

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
