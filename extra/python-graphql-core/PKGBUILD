# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-graphql-core
pkgver=3.2.4
pkgrel=2
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
_tag=a2d71e22fa600933779f3a37fa0a759cf0628bc5
source=(git+https://github.com/graphql-python/graphql-core.git#tag=${_tag})
sha256sums=('3801a8f268d9938ce51e6ee00ec3613436de2018cdf6fe59a6b67fc27f84e6f0')

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
