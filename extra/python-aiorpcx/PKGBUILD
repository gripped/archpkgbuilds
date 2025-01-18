# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: smmalis37

pkgname=python-aiorpcx
_pkgname=aiorpcX
pkgver=0.24.0
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver%.0}.tar.gz")
sha256sums=('7545288d9028faf683fbe5726aed7885e32676344d085c6ab165916084e4563b')

build() {
  cd "$_pkgname-${pkgver%.0}"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-${pkgver%.0}"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd "$_pkgname-${pkgver%.0}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
}
