# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Chris Warrick <aur@chriswarrick.com>

pkgname=python-pygal
epoch=1
pkgver=3.1.2
pkgrel=1
pkgdesc='A Python SVG graph plotting library'
arch=('any')
url='https://www.pygal.org/en/stable/'
license=('LGPL-3.0-or-later')
depends=('python-setuptools' 'python-importlib-metadata')
optdepends=('python-lxml: for XML output through lxml instead of xml.etree'
            'python-cairosvg: for PNG output')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-lxml' 'python-pyquery' 'python-cairosvg' 'python-flask')
source=("git+https://github.com/Kozea/pygal.git#tag=$pkgver")
sha256sums=('697b31f8509dd876c7b600e14fe041981d937bdf9fdc01614bb2c0ae3fab6d61')

prepare() {
  sed -ri "s/'pytest-runner'(, )?//" pygal/setup.py
}

build() {
  cd pygal
  python -m build --wheel --no-isolation
}

check() {
  cd pygal
  pytest pygal/
}

package() {
  cd pygal
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
