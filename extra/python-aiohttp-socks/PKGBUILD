# Maintainer: Santiago Torres-Arias <santiago@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-aiohttp-socks
pkgver=0.11.0
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
b2sums=('60a5d81055879fb96a0c99d8d4a075631ecd4813f9946a3a7d32362840eb9c0bbc7eea5204ef55cdd7519e3948ff3b5dbf423bf2996253ad1e92433b2512eda4')
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
