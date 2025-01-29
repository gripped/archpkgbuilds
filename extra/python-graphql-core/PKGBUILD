# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-graphql-core
pkgver=3.2.6
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
_tag=b7935f75511dde280325631541f4a8a24b245709
source=(git+https://github.com/graphql-python/graphql-core.git#tag=${_tag})
sha256sums=('7becc5194c6c1ae11103ea2a933787ed0895764104e173bb55162dfb20fde9c3')

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
