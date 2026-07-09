# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=uvicorn
pkgver=0.51.0
pkgrel=1
pkgdesc='The lightning-fast ASGI server'
arch=(any)
url=https://github.com/encode/uvicorn
license=(BSD-3-Clause)
depends=(
  python
  python-click
  python-h11
  python-typing_extensions
)

optdepends=(
  'python-a2wsgi: for WSGI support'
  'python-dotenv: for --env-file support'
  'python-gunicorn: for Gunicorn workers'
  'python-httptools: for faster HTTP protocol handling'
  'python-pyyaml: for --log-config with YAML'
  'python-uvloop: for faster event loop'
  'python-watchfiles: for --reload support'
  'python-websockets: for WebSocket support'
  'python-wsproto: for WebSocket support'
)

makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
source=(git+https://github.com/encode/uvicorn#tag=${pkgver})
b2sums=('ef96c0c3deaf07fb208fd32ea8ce4ff77ea2b793b9d31c1098e06928aa097d31aa7b666de68da2d57479aeff527c0f3430417a7c0a5ff24aaab479bada511935')



build() {
  cd uvicorn
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" uvicorn/dist/*.whl
  install -Dm 644 uvicorn/LICENSE.md -t "${pkgdir}"/usr/share/licenses/uvicorn/
}

# vim:set ts=2 sw=2 et:
