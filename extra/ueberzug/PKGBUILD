# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: arkhan <arkhan@disroot.org>

pkgname=ueberzug
pkgver=18.3.1
pkgrel=5
pkgdesc='Command line util which allows to display images in combination with X11'
arch=('x86_64')
url=https://github.com/ueber-devel/ueberzug
license=('GPL-3.0-or-later')
options=(!lto)
depends=(
    'libxext'
    'libxres'
    'python-attrs'
    'python-docopt'
    'python-pillow'
)
makedepends=(
    'meson-python'
    'python-build'
    'python-installer'
    'python-wheel'
)
provides=("python-$pkgname")
replaces=("python-$pkgname")
source=("https://github.com/ueber-devel/ueberzug/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7e775065b60ceacc7f45928bfb62ab85a5afc7f8b556a008ea2a585ef591c6af')
b2sums=('879f4dd7898a569cf70200fb683d6220bd410b7738963527030e504c59ef9095a28c4380c695ae8034ac2cd1d841df044ad4cad34f72c3ad24b8ef32c9473f7e')

build() {
    cd $pkgname-$pkgver
    # set a fixed build dir to fix repro issue, see
    # https://github.com/mesonbuild/meson-python/issues/703 for details
    python -m build --wheel --no-isolation -Cbuild-dir=build
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
