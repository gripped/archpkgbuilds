# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=python-wcmatch
pkgver=12.0
pkgrel=1
pkgdesc='Wilcard File Name matching library'
arch=('any')
url='https://github.com/facelessuser/wcmatch'
license=('MIT')
depends=('python-bracex')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("https://github.com/facelessuser/wcmatch/archive/${pkgver}/wcmatch-${pkgver}.tar.gz")
b2sums=('11dfa97a1e2d9a72f46eb40f06bd57d92449f730fa13df97b0678b4f877662f1886c8001538ec7d03e819d33b8f564f6b6aceafd6e7c2d0b0179be78966a5020')

build() {
  cd wcmatch-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd wcmatch-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
