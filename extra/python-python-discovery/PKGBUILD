# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-python-discovery
pkgver=1.3.0
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
sha512sums=('1200d3bd03275f11b0abee23b37f033326c82135a23ad45ced6b3ce0001147eb82872604c176b52732b068b2813b30129943ff2449d331138f51dd177962bf1b')
b2sums=('ee4f7159e62b4c6fa7ba277635cea99308d7ed54426a0bb2a968728c9c70545a7df68f2b512772ae60efbf82024bcb692ab1bed6ca542342ad62a8625345559b')

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
