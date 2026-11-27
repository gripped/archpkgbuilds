# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pytest-services
pkgname=python-pytest-services
pkgver=2.3.0
pkgrel=1
pkgdesc="Services plugin for pytest testing framework"
arch=(any)
url="https://github.com/pytest-dev/pytest-services"
license=(MIT)
depends=(
  python
  python-pytest
  python-requests
  python-psutil
  python-zc.lockfile
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  memcached
  python-astroid
  python-mysqlclient
  python-pylibmc
  xorg-server-xvfb
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('6e1bef15a1582725932f2b1c20cf622f0e7fa13487c9a61e2a3a239966329ddfb6865e3c8adf54d9d0bdb5c98d88eec149195faac3cb5c366b606922f73020d1')
b2sums=('ad202e7ba0b4ef7e1acda7a55d6145ff40d34a38457776dbe71ab7c669c4434520759e21194d9bfd86c4bbfe8c5c3a9d9d61029d2199f73dba4cc039ee51aa94')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir="tmp_install" dist/*.whl
  export PYTHONPATH="$PWD/tmp_install/$_site_packages/:$PYTHONPATH:$PWD/tests"
  pytest -vv -k 'not test_mysql'
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CHANGES,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
