# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python-gevent
pkgver=25.5.1
pkgrel=1
pkgdesc='Python network library that uses greenlet and libenv for easy and scalable concurrency'
arch=('x86_64')
url='http://www.gevent.org'
license=('MIT')
depends=(
  'c-ares'
  'libev'
  'python-greenlet'
  'python-setuptools'
  'python-zope-event'
  'python-zope-interface'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'cython'
  'python-cffi'
  'libuv'
)
checkdepends=(
  'lsof'
  'python-perf'
  'python-objgraph'
  'python-dnspython'
  'python-requests'
)
source=("$pkgname::git+https://github.com/gevent/gevent#tag=$pkgver")
sha512sums=('5d66c25fefa8bb1fd9cac447375449a8731646d217293f4447bd2d815c8b4ab9d997bffc471f7fcba9498c80fc697dcd5f72317da9736ccdacc7e5c31b10177e')
b2sums=('93a9e57a0e2d444472493d829507877d0f5ce8608513a4701f8807b249ae10ff58c36caf95e3ffc30b8ac133fbbda0848d9bf6a2e30c3a383a255acc3d9f48ca')

build() {
  cd "$pkgname"

  # http://www.gevent.org/development/installing_from_source.html#embedding-libraries
  export GEVENTSETUP_EMBED=0

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m gevent.tests || echo "Tests failed"
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
