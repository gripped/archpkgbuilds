# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-colorlog
pkgver=6.9.0
pkgrel=2
pkgdesc='A colored formatter for the python logging module'
arch=('any')
url='https://github.com/borntyping/python-colorlog'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9959252ae980422b09e5ad2a7e42aac6291a73ad792971aa15a343dd382b7c5b2e12fc9ccf55c16c23e81f6aba37a538d27614819c05b94bb16393bed971868b')

build() {
  cd $pkgname-$pkgver

  python -m build -nw
}

package() {
  cd $pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
