# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=python-cheroot
pkgdesc="Highly-optimized, pure-python HTTP server"
pkgver=11.0.0
pkgrel=1
arch=(any)
url="https://github.com/cherrypy/cheroot"
license=(BSD-3-Clause)
depends=(
  python
  python-jaraco.functools
  python-more-itertools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-chardet
  python-colorama
  python-jaraco.context
  python-portend
  python-pyopenssl
  python-pytest
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-sugar
  python-pytest-xdist
  python-requests-toolbelt
  python-requests-unixsocket
  python-trustme
  python-urllib3
  python-watchdog
)
optdepends=('python-pyopenssl: for SSL and certificate handling within cheroot')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8d63c88177b12badf613b9cbfecada9c5eeff38857046fb24dae31efca88e811fd103df8929739028dcf16d492f651bb976a9db81c9dce94d21d362efa63cfe3')
b2sums=('8ff226f7bdd74f90de1dbf66649b48a7b1f094c49df7e611251ff23a7040d22b77f6ef281e702f0137992f30931f19aa798fc31ccb6444a1566d55821c757ae2')

build() {
  cd ${pkgname#python-}-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  pytest --override-ini="addopts=" -n auto \
    --ignore=cheroot/test/test_server.py \
    -W=ignore::DeprecationWarning \
    -W=ignore::pytest.PytestUnhandledThreadExceptionWarning
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
