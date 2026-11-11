# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-eventlet
pkgver=0.41.3
pkgrel=1
pkgdesc='Highly concurrent networking library'
url='https://eventlet.net'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-dnspython'
  'python-greenlet'
)
makedepends=(
  'python-build'
  'python-hatch-vcs'
  'python-hatchling'
  'python-installer'
  'python-sphinx'
  'python-sphinxcontrib-apidoc'
)
checkdepends=(
  'python-httplib2'
  'python-psycopg2'
  'python-pyopenssl'
  'python-pytest'
  'python-pyzmq'
)
optdepends=(
  'python-httplib2: non-blocking HTTP support'
  'python-psycopg2: non-blocking PostgreSQL support'
  'python-pyopenssl: non-blocking SSL support'
  'python-pyzmq: non-blocking ZeroMQ support'
)
source=("https://github.com/eventlet/eventlet/archive/$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha512sums=('92ae27056109dd5a195244a4607cd390b0072e9e06ebaeef29782d40a2b8df3ac53c62e4ffd5f0c0e1113c3c98831e51e61d5e42eed7e53f91ae92f476363e32')
b2sums=('9c4f285760b3817b2421272e801db70f9b048e831bc950b30d48c0120d2aada1604d22bcb1f1a0dcb57cc2bf4e9007c007bb9b250b3b5968608ce90fae1c9c8f')

build() {
  cd ${pkgname#python-}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  python -m venv --system-site-packages doc-env
  doc-env/bin/python -m installer dist/*.whl
  local site_packages=$(doc-env/bin/python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$site_packages" sphinx-build -d /tmp -b text doc/source doc/build/html
}

check() {
  cd ${pkgname#python-}-$pkgver
  # test_ssl_close already failed under Python3.12 "known regression"
  pytest tests --deselect=tests/ssl_test.py::SSLTest::test_ssl_close 
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  install -vdm 755 "$pkgdir/usr/share/doc/$pkgname"
  cp -vr doc/build/html "$pkgdir/usr/share/doc/$pkgname"
  cp -vr examples "$pkgdir/usr/share/doc/$pkgname"
}
