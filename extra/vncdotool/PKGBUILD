# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=vncdotool
pkgver=1.3.0
pkgrel=1
pkgdesc='A command line VNC client'
arch=('any')
url='https://github.com/sibson/vncdotool'
license=('MIT')
depends=('python-pillow' 'python-twisted' 'python-pycryptodomex')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=($pkgname-$pkgver.tar.gz::https://github.com/sibson/vncdotool/archive/v$pkgver.tar.gz)
sha512sums=('07247c7c18463110b6d3e69435364468ecf7981a3aa8d2caa2165656c2d7c920b5a34569ecfc9a7d4b68d35408765bfd2ecf002e55887d779049fea35eb549b3')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
