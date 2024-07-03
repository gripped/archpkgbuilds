# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-time-machine
pkgver=2.14.2
pkgrel=1
pkgdesc='Travel through time in your tests'
arch=('x86_64')
url='https://github.com/adamchainz/time-machine'
license=('MIT')
depends=(
  'python'
  'python-dateutil'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-randomly'
)
optdepends=('python-pytest: for pytest plugin')
source=("$pkgname::git+$url#tag=$pkgver")
b2sums=('375f4258ffe7f8dd63c96b8cec6552fdf64a4aed3abee0e52a302865eb5bbe3874d26bdca69813d7a25e5ca0319949a1fd70d494a763b312943116681d9c952a')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # install to temporary directory
  python -m installer --destdir="$(pwd)/tmp_install" dist/*.whl

  PYTHONPATH="$(pwd)/tmp_install$site_packages" \
    pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/time_machine-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
