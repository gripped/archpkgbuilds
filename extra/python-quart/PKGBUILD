# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-quart
pkgver=0.21.0
pkgrel=1
pkgdesc='A Python ASGI web microframework with the same API as Flask'
url=https://github.com/pallets/quart
arch=(any)
license=(MIT)
depends=(
  hypercorn
  python
  python-aiofiles
  python-blinker
  python-click
  python-flask
  python-importlib-metadata
  python-itsdangerous
  python-jinja
  python-markupsafe
  python-werkzeug
)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
  python-wheel
)
checkdepends=(
  python-dotenv
  python-hypothesis
  python-pytest
  python-pytest-asyncio
)
optdepends=('python-dotenv: support for .env files')
source=(git+https://github.com/pallets/quart.git#tag=${pkgver})
b2sums=('152371886f74ca1ea83ed01ed5a6866aa69736f1b94986830082f9a26233a89155f5ca0db2f066f9d535e6c99d250af12d3aa249940ebbdf59fde644d9dde613')

prepare() {
  cd quart
  sed 's/name = "Quart"/name = "quart"/' -i pyproject.toml
  sed 's/flit-core<4/flit-core/' -i pyproject.toml
}

build() {
  cd quart
  python -m build --wheel --no-isolation
}

check() {
  cd quart
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd quart
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
