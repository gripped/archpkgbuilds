# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-time-machine
pkgver=3.1.0
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
b2sums=('f09b316f4d88084d467f7f0b1c177770e099ec58b71f0726cb63ec29e56d35ea3b94166175707339130ab212a3e7dac9c23dd227e97e470a96ac73d02aff2751')

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
