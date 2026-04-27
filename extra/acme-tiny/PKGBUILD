# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Tom Hacohen <tom@stosb.com>
pkgname=acme-tiny
pkgver=5.0.3
pkgrel=1
pkgdesc="A tiny script to issue and renew TLS certs from Let's Encrypt"
url="https://github.com/diafygi/acme-tiny"
depends=('python' 'openssl')
license=('MIT')
arch=('any')
source=($pkgname-$pkgver.tar.gz::https://github.com/diafygi/acme-tiny/archive/${pkgver}.tar.gz)
sha256sums=('003e80b1bd982c69372ac1df7890ce90093eed2dfa877b45edeb890457a29d6f')

package() {
    cd "$srcdir"/acme-tiny-${pkgver}

    install -Dm 755 acme_tiny.py "$pkgdir/usr/bin/acme-tiny"
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

