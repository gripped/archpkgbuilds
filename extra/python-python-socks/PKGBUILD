# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-python-socks
pkgver=2.8.0
pkgrel=1
pkgdesc='Core proxy client (SOCKS4, SOCKS5, HTTP) functionality for Python'
arch=('any')
url='https://github.com/romis2012/python-socks'
license=('Apache-2.0')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-anyio'
  'python-curio'
  'python-flask'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-trio'
  'python-tiny-proxy'
  'python-trio'
  'python-trustme'
  'python-yarl'
)
optdepends=(
  'python-anyio: anyio support'
  'python-curio: curio support'
  'python-trio: trio support'
)
provides=('python-python_socks')
replaces=('python-python_socks')
source=("git+$url.git?signed#tag=v$pkgver")
sha512sums=('743e5acdfeb0ecea58f59a02e70a91218694aa69dfeada437f0fd5f9164b21da13270031d662ae4f080416541dda99b03dfdc033ee22a8ffb0bd78be1392a525')
validpgpkeys=('706A8935FED55F3BFB7C188B5EEAD7400A5D80ED') # Roman Snegirev <rsng@mail.ru>

build() {
  cd "${pkgname#python-}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname#python-}"
  pytest
}

package() {
  cd "${pkgname#python-}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
