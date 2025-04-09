# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

_name=identify
pkgname=python-identify
pkgver=2.6.9
pkgrel=1
pkgdesc="File identification library for Python"
arch=(any)
url="https://github.com/pre-commit/identify"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-ukkonen
)
optdepends=(
  'python-ukkonen: for returning license identifiers'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('23b806a9faf84ae4b523dc9d2d7c489263f32b7bbc6fe1804498aa1265e20def01c8f80f77ba69ce58ca4393b655a34e62d03112b7ce2cb1a6d8974fde4bdc12')
b2sums=('5dfd091596bc0609861a47cb56f62a37b187fe8989515199f508b7623877a3607168644b4dea1c3c374f061b97517acfd4f917884a3b6cebb1a5d9bb6130908e')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
