# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-pika
pkgver=1.4.1
pkgrel=1
pkgdesc="Pure Python RabbitMQ/AMQP 0-9-1 client library"
arch=(any)
url="https://github.com/pika/pika/"
license=('BSD-3-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
# checkdepends=('python-tornado' 'python-twisted' 'python-gevent')
optdepends=('python-tornado: use with Tornado I/O loop'
            'python-twisted: use with Twisted I/O loop'
            'python-gevent: use with Gevent I/O loop')
source=("git+https://github.com/pika/pika.git#tag=${pkgver}")
sha256sums=('cbd6b3fa8626c8b012a845f5d2a57a1bc123277559b00d18a9bbc3d4a996179b')

build() {
  cd pika
  python -m build --wheel --no-isolation
}

check() {
  cd pika
  # Requires rabbitq node
}

package() {
  cd pika
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
