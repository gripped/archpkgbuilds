# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-time-machine
pkgver=2.17.0
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
  'python-tokenize-rt'
)
optdepends=(
  'python-pytest: for pytest plugin'
  'python-tokenize-rt: for the migration tool'
)
source=("$pkgname::git+$url#tag=$pkgver")
b2sums=('1b8b9810558e5cc310134ba05fece8d1ae51aa16aef0e4901b8d4ddf8b5f261a990d23a414f0b56b743f8f91fe2ec91c14f84e4d10ac8497956a6f352ea70cd7')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/time_machine-$pkgver.dist-info/licenses/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname"

  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
