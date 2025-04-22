# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-eventlet
pkgver=0.39.1
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
sha512sums=('02c364fa867aa21914730e88a2337b581f46bddc7c77472b70047eb8467f5f19223f716ea1a336fd0f03606c6e873e64d22bffbf566fbd591840378c96612bbd')
b2sums=('1adcbfeeffc45ef283b8245cfbd2e57b4c076ac4409064ac11e45b6cbc0364b1846dc89e17a5a971b8286c6395fb046c02101cf471053fd8e79298ea68837387')

build() {
  cd ${pkgname#python-}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation

  python -m venv --system-site-packages doc-env
  doc-env/bin/python -m installer dist/*.whl
  local site_packages=$(doc-env/bin/python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$site_packages" sphinx-build -b text doc/source doc/build/html
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

# vim: ts=2 sw=2 et:
