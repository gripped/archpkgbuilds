# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: gardar <aur@gardar.net>
pkgname=python-pynetbox
_name="${pkgname#python-}"
pkgver=7.6.0
pkgrel=1
pkgdesc="NetBox API client library"
arch=('any')
url="https://github.com/netbox-community/pynetbox"
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-pyyaml')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('287c9f283a0741bbb6f39167382347a686d5142bd469eac7bad316e4010c5d3193cd05a12c109b56bbaf5be59313a274048e779a3e9cbf21ded787caa965c459')
b2sums=('a55dd895f1d1fe0c938a88d93cdc2d5b5c0800eb9858c23e8baebabc26a8f77862d7fb38a8bdd45aca3d6f5e7d742694aefea0e519577c73279d77b99ff55619')

build() {
  cd "$_name-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd "$_name-${pkgver}"
  pytest -vv --ignore tests/integration
}

package() {
  cd "$_name-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
