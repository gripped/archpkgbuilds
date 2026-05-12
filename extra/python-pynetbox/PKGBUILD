# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: gardar <aur@gardar.net>
pkgname=python-pynetbox
_name="${pkgname#python-}"
pkgver=7.7.0
pkgrel=1
pkgdesc="NetBox API client library"
arch=('any')
url="https://github.com/netbox-community/pynetbox"
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-pyyaml')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('b174f181d41e923cba4d3efc0b2bb12f0ddcbb4ce693123e9d57d14be7922a5b30fea51647d55991358fb4b0778ad79aab80aecb3becf33abaf47ef874cff26e')
b2sums=('28525c6a8ffd1ea860ff6017f1f1938f7ca697b138ddcc145f92664c682ed4c165c6b17718a1e78a1d34b38869e643e0618094eebc7ff32cb11c515d48a9a173')

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
