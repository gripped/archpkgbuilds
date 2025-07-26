# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-eventlet
pkgver=0.40.2
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
sha512sums=('9864c8ccfdd9b9f2a05949f08efc3191b3070f24a42f92bad324b9b81c4ee7bef38c9b3e22e038076f548ea4589f0726ddc26f3ecb003994135ef0d5f8616b04')
b2sums=('b20f5b772696949e9c63d101ba85ea405e743054dec1d2503ae5d8d5389f201ba42a05c236794a677e4490bfe9994a19977d2d24f5fcd78203f81e97b550d764')

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
