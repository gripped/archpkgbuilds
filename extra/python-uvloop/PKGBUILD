# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

_pkgname=uvloop
pkgname=python-$_pkgname
pkgver=0.18.0
pkgrel=1
pkgdesc='Ultra fast asyncio event loop'
arch=('x86_64')
url='https://github.com/MagicStack/uvloop'
license=('Apache' 'MIT')
depends=('python' 'libuv')
makedepends=('python-setuptools' 'cython0' 'git')
_tag=5ddf38bccad1107e6488357fd3dbb6b886b95134
source=(git+https://github.com/MagicStack/uvloop.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd $_pkgname

  git describe --tags | sed 's/^v//'
}

build() {
  cd $_pkgname

  python setup.py build build_ext --use-system-libuv
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE-APACHE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-APACHE
  install -Dm 644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
