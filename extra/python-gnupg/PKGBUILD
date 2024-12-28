# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Sven Klomp <mail@klomp.eu>

pkgname=python-gnupg
pkgdesc="A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
pkgver=0.5.3
pkgrel=2
arch=(any)
url="https://github.com/vsajip/python-gnupg/"
license=(BSD-3-Clause)
depends=(
  gnupg
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz{,.asc})
sha512sums=('88a2d754df7265aefac6b9a0651c7e933125ba7f8170bda7e867f5dd8bb54272609c26d0ce17a15afa7710baebe06fa3ab211e2af1d1d84eb1f1c65ba7a1dd6a'
            'SKIP')
b2sums=('d5b646b2aadfef922d1b3116259b0f02668df373375676e679fd900bf001c91b58dd6fb06c8e3470d4135f4ef6b45fd1c5f63a78d3425e82931f2c190a28b129'
        'SKIP')
validpgpkeys=('CA749061914EAC138E66EADB9147B477339A9B86') # Vinay Sajip (CODE SIGNING KEY) <vinay_sajip@yahoo.co.uk>

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  export NO_EXTERNAL_TESTS='true'
  pytest -vv
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
