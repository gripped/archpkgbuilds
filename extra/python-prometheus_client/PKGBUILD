# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-prometheus_client
pkgver=0.23.0
pkgrel=1

pkgdesc="Prometheus instrumentation library for Python applications"
url="https://github.com/prometheus/client_python"
arch=('any')
license=('APACHE')

depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-twisted' 'python-pytest')

source=(client_python-$pkgver.tar.gz::https://github.com/prometheus/client_python/archive/v${pkgver}.tar.gz)

sha512sums=('14eb53b3c29b6d38de642f6b6187af34a2d7a271fc34b2a0d62f25e02551d02cefc1096f2a7bf7e4b8d9f7d4679fc48fde47df35aeb501798cbfeda8abe1c073')

build() {
  cd client_python-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd client_python-$pkgver
  # Make reproducible by not writing pyc files for test files. (rebuilderd does not run tests)
  PYTHONDONTWRITEBYTECODE=1 python -m unittest discover -vs .
}

package() {
  cd client_python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
