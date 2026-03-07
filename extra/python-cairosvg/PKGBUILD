# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-cairosvg
pkgver=2.8.0
pkgrel=1
pkgdesc='SVG converter based on Cairo. It can export SVG files to PDF, PostScript and PNG files'
arch=('any')
url='https://cairosvg.org'
license=('LGPL3')
depends=('python-cairocffi' 'python-cssselect2' 'python-defusedxml' 'python-pillow' 'python-tinycss2')
makedepends=('git' 'python-build' 'python-installer' 'python-pytest' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
replaces=('cairosvg')
source=("git+https://github.com/Kozea/CairoSVG.git#tag=$pkgver")
sha512sums=('058737b218057c48d7ea3b50e5d95f4850e236586fc41f7b68b6ad34b8c8073e64f638ec6267a7475eecc9c4c9e451a6d81aa5c45660793e13e6ebc007eb9c66')

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
