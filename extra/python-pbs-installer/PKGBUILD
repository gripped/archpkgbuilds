# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-pbs-installer
_name="${pkgname#python-}"
pkgver=2025.10.14
pkgrel=1
pkgdesc="Installer for Python Build Standalone"
arch=(any)
url="https://github.com/frostming/pbs-installer"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
)
optdepends=(
  'python-httpx: for download support'
  'python-zstandard: for zstd installation support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('f40973a2c5f8b6af8d7f8003f0c6ac6c6e1c5fc59a2bd76733733076b5da171a0b90ed5bfde959c5e67d30ab76adc1854612654953b0f14001240e5a91ef7edb')
b2sums=('c08b69ab66dfbb72030134b6edd98ef0ee688b2e0221a8103f459fa5755fc9db81d0f5e8c455e7f7ade3a231a2e76a66b3932698d5bf1119382d509fe2255d16')

build() {
  cd $_name-$pkgver
  PDM_BUILD_SCM_VERSION=$pkgver python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
