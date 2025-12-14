# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: smmalis37

pkgname=python-aiorpcx
_pkgname=aiorpcX
pkgver=0.25.0
pkgrel=2
pkgdesc="A generic asyncio library implementation of RPC suitable for an application that is a client, server or both"
url="https://github.com/kyuupichan/aiorpcX"
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
  'python-websockets'
)
optdepends=('python-websockets: websocket transport')
source=(
  "$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "$url/commit/b8ce32889c45c98b44c4e247ec0b0ae206e9ee91.patch"
)
sha512sums=('324093a9fbc1170ff3f9f8f97e6cea9250ba2a6fb32bacb12cf8bc67ff2f2abc941aa76158a3842e86b32300bcde48641730d1fb0afa73e647dd7ac5cea911df'
            '010f8215ec3161e7f624172ff9e6b8d60d37afba7edadc5a26cd0a81f8599f8678855197b82d6291302591487cf00aad5f256f5eb82e0ed80e2af24319bcb0d7')

prepare() {
  cd $_pkgname-$pkgver
  # python-pytest-asyncio 1.X compatibility
  patch -p1 -i ../b8ce32889c45c98b44c4e247ec0b0ae206e9ee91.patch
}

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
