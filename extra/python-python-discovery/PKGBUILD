# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-python-discovery
pkgver=1.4.0
pkgrel=1
pkgdesc='Python interpreter discovery'
arch=(any)
url='https://python-discovery.readthedocs.io'
license=(MIT)
depends=(
  python
  python-filelock
  python-platformdirs
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-setuptools
)
source=("$pkgname::git+https://github.com/tox-dev/python-discovery#tag=$pkgver")
sha512sums=('04aa11a7fda7fa304f6d16cb63ed2cf8735c5a3727b44b455fcf9142e706756fa8c92c9442c88844fa31a909d5cef11b54eb24ee3ab0b93896751dfa4cc6d87c')
b2sums=('69e938da30af0afaae58902b262180a0e69ac38fc366887ba1eb77f41600b5d62a24fe5b80d8ecce7565999de61d079bc3e16ae260fd109ed320ca53ef7cf7a2')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

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
