# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-prometheus_client
pkgver=0.25.0
pkgrel=1

pkgdesc="Prometheus instrumentation library for Python applications"
url="https://github.com/prometheus/client_python"
arch=('any')
license=('APACHE')

depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-twisted' 'python-pytest' 'python-aiohttp' 'python-snappy' 'python-asgiref' 'python-django')
optdepends=('python-snappy: snappy compression support'
	    'python-aiohttp: aiohttp server support'
	    'python-django: django exporter support')

source=(client_python-$pkgver.tar.gz::https://github.com/prometheus/client_python/archive/v${pkgver}.tar.gz)

sha512sums=('58658326c58544c3bfafec6d5209c49baea9d3dc43d6bfae6c630dac73d91d7cace9a8740c1a18c65505a7dc5ac84b0feffa93babcd9ca68007ecf3cefb09bad')

prepare() {
  cd client_python-$pkgver
}

build() {
  cd client_python-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd client_python-$pkgver
  # Make reproducible by not writing pyc files for test files. (rebuilderd does not run tests)
  PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=. python -m unittest discover -vs .
}

package() {
  cd client_python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
