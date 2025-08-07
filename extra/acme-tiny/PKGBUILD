# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Tom Hacohen <tom@stosb.com>
pkgname=acme-tiny
pkgver=5.0.2
pkgrel=1
pkgdesc="A tiny script to issue and renew TLS certs from Let's Encrypt"
url="https://github.com/diafygi/acme-tiny"
depends=('python' 'openssl')
license=('MIT')
arch=('any')
source=($pkgname-$pkgver.tar.gz::https://github.com/diafygi/acme-tiny/archive/${pkgver}.tar.gz)
sha256sums=('f0436c37a2cc33b8a228a7be356b38cf7fa992aca1a52af9bb164e180bdef649')

package() {
    cd "$srcdir"/acme-tiny-${pkgver}

    install -Dm 755 acme_tiny.py "$pkgdir/usr/bin/acme-tiny"
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

