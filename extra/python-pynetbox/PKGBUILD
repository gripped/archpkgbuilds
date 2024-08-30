# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: gardar <aur@gardar.net>
pkgname=python-pynetbox
_name="${pkgname#python-}"
pkgver=7.3.4
pkgrel=1
pkgdesc="NetBox API client library"
arch=('any')
url="https://github.com/netbox-community/pynetbox"
license=('Apache-2.0')
depends=('python' 'python-packaging' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-pyyaml')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('fdc4600fd36ac4c303f855bcf662271043a39b38902780963e1c44fd59d2a5c34ab52ac79697e620b9e28abd2ea4fe37ea483c53d5f17cc3a76773e8e3b7856c')
b2sums=('060b958cde8880341499035889f6bb46a72179e6eb7cfceb0e0ad2da307c54a21ffa5f4cbd2c55cb3bd27be2372886b1db49c8b9d25c45b2d0d0ba01769ed92d')

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
