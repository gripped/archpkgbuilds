# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-graphql-core
pkgver=3.2.5
pkgrel=1
pkgdesc='GraphQL base implementation for Python'
url=https://github.com/graphql-python/graphql-core
arch=(any)
license=(MIT)
depends=(
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-benchmark
)
_tag=f27763352ec53cd5ff20b3382475472d9c091dda
source=(git+https://github.com/graphql-python/graphql-core.git#tag=${_tag})
sha256sums=('b1ef8aa5e05366442d5594b29442f385da2a36e59a4e9bdb41c3908e72ca98c8')

pkgver() {
  cd graphql-core
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd graphql-core
  # HACK: workaround older setuptools requirements
  sed -i 's/setuptools>=59,<70/setuptools/' pyproject.toml
}

build() {
  cd graphql-core
  python -m build --wheel --no-isolation
}

check() {
  cd graphql-core
  PYTHONPATH="$PWD/src" pytest -vv -o addopts=''
}

package() {
  python -m installer --destdir="${pkgdir}" graphql-core/dist/*.whl
  install -Dm 644 graphql-core/LICENSE -t "${pkgdir}"/usr/share/licenses/python-graphql-core/
}

# vim: ts=2 sw=2 et:
