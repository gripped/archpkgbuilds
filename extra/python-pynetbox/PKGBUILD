# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: gardar <aur@gardar.net>
pkgname=python-pynetbox
_name="${pkgname#python-}"
pkgver=7.5.0
pkgrel=1
pkgdesc="NetBox API client library"
arch=('any')
url="https://github.com/netbox-community/pynetbox"
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-pyyaml')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('da5139a8054d5854fbc3f5294503b7474aeec1df72cfe0bca3b24fb43dc77fce5d2a02f0a0059c370425bb66cdc190939c7db650a3a4804c55271afca3fbcf31')
b2sums=('5bc20f33bda9de5881893355070b13454ccdae0a1a73212d95a9e4261208016b7bbb3c2dab2a16d10887d119de6ecfa44a51b6b3ac7d9a67cb8ab44b53409967')

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
