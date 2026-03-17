# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-cairosvg
pkgver=2.8.1
pkgrel=1
pkgdesc='SVG converter based on Cairo. It can export SVG files to PDF, PostScript and PNG files'
arch=('any')
url='https://cairosvg.org'
license=('LGPL-3.0-or-later')
depends=('python-cairocffi' 'python-cssselect2' 'python-defusedxml' 'python-pillow' 'python-tinycss2')
makedepends=('git' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
replaces=('cairosvg')
source=("git+https://github.com/Kozea/CairoSVG.git#tag=$pkgver")
sha512sums=('fcee40fe23261c1fc51991cb4f76fa619ce55d26082b93181723e788fba1364ad5edcf42bda3940cb9e6a22bcbb45b67e63afc89025f486c72640c7b1915c5e4')

prepare() {
  cd CairoSVG

  cp -r cairosvg test_non_regression/cairosvg_reference/
}

build() {
  cd CairoSVG

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd CairoSVG

  pytest
}

package() {
  cd CairoSVG

  python -m installer --destdir="$pkgdir" dist/*.whl
}
