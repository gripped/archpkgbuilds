# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-id
_name="${pkgname#python-}"
pkgver=1.6.0
pkgrel=1
pkgdesc="A tool for generating OIDC identities"
arch=(any)
url="https://github.com/di/id"
license=(Apache-2.0)
depends=(
  python
  python-urllib3
)
makedepends=(
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-pytest
  python-pretend
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('1bcc4c36bf5e79da04fa94f9efa00a642a66a1ca02f9dce8bba4ae76d426827a0a060481eaacd5a948eb83837286bd2be29fefea19a9ae92ee208cbbc0b0e23d')
b2sums=('eed37815071faad0e0fc1cadb2f6634a90b60fcb5af3d19515f2a7629124257864f2048b590169cca67a5e39b4dd1f90cd3e6a331ce245e541a956550f80967c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  PYTHONPATH="." pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
