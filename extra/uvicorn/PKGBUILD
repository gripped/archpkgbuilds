# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=uvicorn
pkgver=0.52.0
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
b2sums=('45efe7ce74d3740838fb2b636f000e149b205737b9b8a511c376e3e8c3c8a355c1fa9e2309970454f51a01b9ca461d5cf3e49a2027672f3b32fca1d5ea0244fe')



build() {
  cd uvicorn
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" uvicorn/dist/*.whl
  install -Dm 644 uvicorn/LICENSE.md -t "${pkgdir}"/usr/share/licenses/uvicorn/
}
