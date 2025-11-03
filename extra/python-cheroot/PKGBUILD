# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgname=python-cheroot
pkgdesc="Highly-optimized, pure-python HTTP server"
pkgver=11.1.0
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
sha512sums=('f353547d15864aeec4b0a260f0a49151e9c44d1b8f071b6252c54368693edc2fef9841729ec64adc542760219393205890434f877f7840136a7a5bcc185396b2')
b2sums=('64ac38f30358729101549ea373a0cdbd12ae7c969dc716e573cf54d1e415ef48915937cc850620ebf80112672f6b2192a45651a2045b3f4fe881d42e60bb87de')

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
