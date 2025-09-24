# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Matthew Sloan matthew@sloan.cc

pkgname=python-pint
pkgver=0.25
pkgrel=1
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
sha512sums=('f5cc4cf4ce1d49d28f83f4823d5c8bb9234eee8d48316f9b0e44b3ac2a0f3fc4dfac02e335f160d4eab6337a76a64e073ca424f2f73857f3ec02b1b3a4be4801')

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
