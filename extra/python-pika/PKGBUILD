# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-pika
pkgver=1.4.0
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
sha256sums=('d070711cda828f885af8f9a8318e4bc5e741514cc3f3dd4817001eeef9c7a03a')

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
