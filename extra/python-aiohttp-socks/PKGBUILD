# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-aiohttp-socks
pkgver=0.10.1
pkgrel=1
pkgdesc="SOCKS proxy connector for aiohttp. SOCKS4(a) and SOCKS5 are supported."
arch=('any')
url="https://github.com/romis2012/aiohttp-socks"
license=('Apache-2.0')
depends=(
  'python'
  'python-aiohttp'
  'python-python-socks'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-anyio'
  'python-flask'
  'python-pytest'
  'python-pytest-asyncio'
  'python-tiny-proxy'
  'python-trustme'
)
source=("git+$url.git?signed#tag=v$pkgver")
b2sums=('f0210d02145c2ec682ec2b61f7620224e0c63e341329829019cb76c1293ec6c8fa994bc6390aa4d111ff25fe626b10857c5bd635d2e5738ac18139867a76a132')
validpgpkeys=('706A8935FED55F3BFB7C188B5EEAD7400A5D80ED') # Roman Snegirev (maintainer)

build() {
  cd "${pkgname//python-/}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname//python-/}"
  pytest
}

package() {
  cd "${pkgname//python-/}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
