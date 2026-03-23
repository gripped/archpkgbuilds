# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-cairosvg
pkgver=2.8.2
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
sha512sums=('82c63420372fa445f6403f45683c5f6bf9bee6b1d756724621de2e4b05ad08005822160b9a7b56d3e9ffe6cc9c0f8f32010f26303f9f90d859fd021cc8e55f75')

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
