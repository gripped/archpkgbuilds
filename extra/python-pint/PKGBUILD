# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Matthew Sloan matthew@sloan.cc

pkgname=python-pint
pkgver=0.26
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
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
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
sha512sums=('39c7f6c49d1872bfe646ebc07ddda01c7f24c1e6e2f9cd0f5b686ea8440e92fe10ee3b4b22cd854028a92d5db9a7d7327b3c14e2dbf752fb41f9d79d90e2af8a')

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
  ln -s "$site_packages"/pint-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
