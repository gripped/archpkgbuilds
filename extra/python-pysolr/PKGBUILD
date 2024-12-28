# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pysolr
pkgname=python-pysolr
pkgver=3.10.0
pkgrel=2
pkgdesc="Python Solr client"
arch=(any)
url="https://github.com/django-haystack/pysolr"
license=(BSD-3-Clause)
depends=(
  python
  python-setuptools
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
optdepends=(
  'python-kazoo: for solrcloud'
  'python-simplejson: for JSON support'
  'solr: for interfacing a local solr instance'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('907591c1658a30f3f54038f16adc74b1682a28e341e55b99a0aba59d34e6c39d6f5e9d8c1acf0c6ba94e677c8614fe7b67316a816eb71c834a2139b6b5fb94b4')
b2sums=('2d8cb9fdf073d94c2340124a9c1d6efc7e5e136aa79cb737146bced944807d1d9f0850c2165600c661113d1492e7f7fb29f6792eddd3c0c0710091c2179c98cc')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

# NOTE: tests vendor solr *and* zookeeper (including download)

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,{CHANGELOG,README}.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
