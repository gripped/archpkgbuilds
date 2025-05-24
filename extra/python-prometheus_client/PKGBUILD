# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-prometheus_client
pkgver=0.22.0
pkgrel=1

pkgdesc="Prometheus instrumentation library for Python applications"
url="https://github.com/prometheus/client_python"
arch=('any')
license=('APACHE')

depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-twisted' 'python-pytest')

source=(client_python-$pkgver.tar.gz::https://github.com/prometheus/client_python/archive/v${pkgver}.tar.gz)

sha512sums=('1319dbd7a44551498230a2bf3dcdd89274a94a38af95d7d35f5edfdaf1a9dd8e84affd152ba476467eddb43656301b2b0e9b4ac0be543dd002ab6e26ba514d35')

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
