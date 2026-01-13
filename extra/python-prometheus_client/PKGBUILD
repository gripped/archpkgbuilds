# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-prometheus_client
pkgver=0.24.0
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

source=(client_python-$pkgver.tar.gz::https://github.com/prometheus/client_python/archive/v${pkgver}.tar.gz fix-test.patch)

sha512sums=('3e4d5c2fd3263eacfd79c52c0e7b86d301fb053539cd99de5940cae4166d720495c399c45ba417c2602fac6ad283f52c9bc85028a0802f0e289bda5a6adb87bb'
            '4442ff79fc7dc57e500634156ebffbb81b3ac58ae5d1cfaa4e487c85bfcb3e1b73dfa2d9b29c9fd7a5ed4dcae48e79c4fe7139a0b94bf8b72f9691b368a2e57e')

prepare() {
  cd client_python-$pkgver
  patch -Np1 -i ${srcdir}/fix-test.patch
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
