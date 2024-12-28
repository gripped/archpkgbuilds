# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: smmalis37

pkgname=python-aiorpcx
_pkgname=aiorpcX
pkgver=0.23.1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b1fe646457bdf3274fdb8894ce38704ca3ecc6613994bd8ff4e105e2ebb214c6')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
