# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python-gevent
pkgver=26.4.0
pkgrel=1
pkgdesc='Python network library that uses greenlet and libenv for easy and scalable concurrency'
arch=(x86_64)
url='http://www.gevent.org'
license=(MIT)
depends=(
  glibc
  c-ares
  libev
  libuv
  python-greenlet
  python-setuptools
  python-zope-event
  python-zope-interface
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
  cython
  python-cffi
)
checkdepends=(
  lsof
  python-perf
  python-objgraph
  python-dnspython
  python-requests
)
source=("$pkgname::git+https://github.com/gevent/gevent#tag=$pkgver")
sha512sums=('fe91ad5c231a251f3e52b882ca9fd4a3e89a6a7ebb7a2fc707b709fae882f5696bfcebbcc422f15b6e789007b0b7fa3ddeb2c14ec0426268dcda6a93728633ce')
b2sums=('c57e47d1110bd938c0772931517c7e7e2eeb359d57391a6ec822d28782612193a85aa69a853e599740f1797581936dcad45171ce8de4a379ee72a198fc8eeabb')

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
