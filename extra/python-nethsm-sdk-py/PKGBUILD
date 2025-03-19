# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nethsm-sdk-py
pkgname=python-nethsm-sdk-py
pkgver=1.3.0
pkgrel=1
pkgdesc="Client-side Python SDK for NetHSM"
arch=(any)
url="https://github.com/Nitrokey/nethsm-sdk-py"
license=(Apache-2.0)
depends=(
  python
  python-certifi
  python-cryptography
  python-dateutil
  python-typing_extensions
  python-urllib3
)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
provides=(python-nethsm)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('278b872fe0037424213abbb5ed3e47f8e81aeed82d17d7d23ec1fea8f1fc854cd2f1b67a5cc09fbdffae424a52e378199805bd5d28b8878fdf82e184a49ea388')
b2sums=('14e66c1aa85616198ba0ef5f594cbbdf25fc7b4a080618395f199804b93133dfba22c9e4bc3b3dca92540092dce6a47d41eef25bbe8c0e0be27df45feefae87a')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# NOTE: all tests are disabled, because they require docker

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
