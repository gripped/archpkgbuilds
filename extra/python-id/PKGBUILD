# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-id
_name="${pkgname#python-}"
pkgver=1.5.0
pkgrel=2
pkgdesc="A tool for generating OIDC identities"
arch=(any)
url="https://github.com/di/id"
license=(Apache-2.0)
depends=(
  python
  python-requests
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
sha512sums=('bedc354e59d569595b9b7258b3fb2da29f2701a4b9ec80487b98ce30a7077e8b35990bea80db955a95a8d0703d23ab98365077f3c66858f4cab8806f365c25a7')
b2sums=('d5f1b959ed8c5151d049cad9c470e0ed773edb68f5c9e721e2d4d5207823af660c641546651fc4eee1dba398bebdd509098471046f7482f102d8be3ae6e4a846')

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
