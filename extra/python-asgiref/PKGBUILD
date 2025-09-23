# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-asgiref
pkgver=3.9.2
pkgrel=1
pkgdesc="Reference ASGI adapters and channel layers"
arch=(any)
url="http://github.com/django/asgiref"
license=('BSD-3-Clause')
makedepends=('python-setuptools')
checkdepends=(python-pytest python-pytest-asyncio)
depends=('python')
source=("https://pypi.io/packages/source/a/asgiref/asgiref-${pkgver}.tar.gz")
sha256sums=('a0249afacb66688ef258ffe503528360443e2b9a8d8c4581b6ebefa58c841ef1')

build() {
    cd "asgiref-${pkgver}"
    python setup.py build
}

check() {
    cd "asgiref-${pkgver}"
    PYTHONPATH=. pytest .
}

package() {
    cd "asgiref-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1

    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
