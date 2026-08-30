# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Matmas <matmas@matmas.net>
# Contributor: Thomas Gubler <thomasgubler@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=python-websocket-client
pkgver=1.9.1
pkgrel=1
pkgdesc="WebSocket client library for Python"
arch=('any')
url="https://github.com/websocket-client/websocket-client"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/w/websocket-client/websocket_client-$pkgver.tar.gz")
sha512sums=('158ad8bd65e52790de18e65ede165a02223eecc015e67d834caf59878c6e16863bae9c1d581df6cd0df82086bd2364ec003c2ab0fe0544f0b037a1f2328ca7a8')

build() {
  cd websocket_client-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd websocket_client-$pkgver
  pytest
}

package() {
  cd websocket_client-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 ft=sh et:
