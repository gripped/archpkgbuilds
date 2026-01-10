# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Matthew Sloan matthew@sloan.cc

pkgname=python-pint
pkgver=0.25.2
pkgrel=2
pkgdesc="A unit library for Python"
arch=('any')
license=('BSD-3-Clause')
url="https://pint.readthedocs.org"
depends=(
  'python'
  'python-flexcache'
  'python-flexparser'
  'python-platformdirs'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
  'python-hatchling'
  'python-hatch-vcs'
)
checkdepends=(
  'python-numpy'
  'python-pytest'
  'python-pytest-benchmark'
  'python-pytest-subtests'
  'python-uncertainties'
)
source=("git+https://github.com/hgrecco/pint.git#tag=$pkgver")
sha512sums=('8d9947c20c0d8761ce3907224be05479cbf7cc7aaf1d2edf384d2d05334a5c6c0fc1addec7bed686374d8cbf7983b0f75cd125ee8c98cc7112d405f7f87c199b')

build() {
  cd pint
  python -m build --wheel --no-isolation
}

check() {
  cd pint
  pytest
}

package() {
  cd pint
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/Pint-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
