# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=uvicorn
pkgver=0.49.0
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
b2sums=('bd94e6512ff88b6114c93ba898c77e9282aeec1b743f0503de81cf55f0ae650a73f5a3fbd87ae75a59e8906add5cc1eac1be35e850847e6b27b30cda2f18959a')



build() {
  cd uvicorn
  python -m build --wheel --no-isolation
}

package() {
  python -m installer --destdir="${pkgdir}" uvicorn/dist/*.whl
  install -Dm 644 uvicorn/LICENSE.md -t "${pkgdir}"/usr/share/licenses/uvicorn/
}

# vim:set ts=2 sw=2 et:
