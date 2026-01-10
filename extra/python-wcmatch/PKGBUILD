# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-wcmatch
pkgver=10.1
pkgrel=2
pkgdesc='Wilcard File Name matching library'
arch=('any')
url='https://github.com/facelessuser/wcmatch'
license=('MIT')
depends=('python-bracex')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("https://github.com/facelessuser/wcmatch/archive/${pkgver}/wcmatch-${pkgver}.tar.gz")
b2sums=('4cb96a5305f55527e98ec695b1dc66ac89b2609768e7abe1719d4127f14f60ca79f7c9fd8db5bf18e04c411b7db7733525303336d14cc2056851aa9538e46573')

build() {
  cd wcmatch-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd wcmatch-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
