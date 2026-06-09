# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-graphql-core
pkgver=3.2.11
pkgrel=1
pkgdesc='GraphQL base implementation for Python'
url=https://github.com/graphql-python/graphql-core
arch=(any)
license=(MIT)
depends=(
  python
  python-typing_extensions
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
source=(git+https://github.com/graphql-python/graphql-core.git#tag=v${pkgver})
sha256sums=('ba9ab96b7762b8d667726f077a3dc16dac7a53151928db8bb69a256b9b2f5bd7')

prepare() {
  cd graphql-core
  # HACK: workaround older setuptools requirements
  sed -i 's/setuptools>=59,<76/setuptools/' pyproject.toml
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
