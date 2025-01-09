# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=pysolfc
pkgver=3.1.0
pkgrel=4
pkgdesc="PySol (Fan Club edition) is an exciting collection of more than 1000 solitaire games"
arch=('any')
url="http://pysolfc.sourceforge.net/"
license=('GPL-3.0-or-later')
depends=(
  'pysolfc-cardsets'
  'python'
  'python-attrs'
  'python-configobj'
  'python-pillow'
  'python-pygame'
  'python-pysol_cards'
  'python-six'
  'tk'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-kivy: Kivy based interface'
)
source=("https://downloads.sourceforge.net/$pkgname/PySolFC-$pkgver.tar.xz")
sha256sums=('3dcf1c703b35b446d78a062b2471b138e22926db9d20207373c465144700a0cc')

prepare() {
  cd PySolFC-$pkgver
  mv pysol.py pysol
  sed -i 's/pysol.py/pysol/' \
    MANIFEST.in \
    data/pysol.desktop \
    setup.py \
    tests/lib/pysol_tests/test_version_flag.py
}

build() {
  cd PySolFC-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd PySolFC-$pkgver
  python -m unittest discover -v
}

package() {
  cd PySolFC-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
