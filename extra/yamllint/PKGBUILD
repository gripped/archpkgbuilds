# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=yamllint
pkgver=1.36.2
pkgrel=1
pkgdesc='Linter for YAML files'
arch=('any')
url='https://github.com/adrienverge/yamllint'
license=('GPL-3.0-or-later')
depends=('python' 'python-pathspec' 'python-yaml')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('39692e3eaf8aecf769f1f730abd08e45151736b0f1883ec28dab6330ab38b9663b220d6d3dece2407054daabe62077f6a094e8f6ce198c3a732a9d0aa948fcf8')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  python -m unittest discover tests
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
