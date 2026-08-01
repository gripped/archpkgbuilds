# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python-gevent
pkgver=26.7.0
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
sha512sums=('5a66d0303bd0fa33de45dbac58a7ef9e1a3dcce28fbf071af5c96fe2b1f56089f7eaf96cda6b3244441ab6a49fee7b46f5d61e9666a39ad8c3d3f116b2f88209')
b2sums=('3d638333b6cde59bb75571065c61af24b4045d179f16b9d6be13480d915ae883c5556b957b85ade86f80c39fa98ce354af03ca78e09326e47c407e82787dafd2')

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
