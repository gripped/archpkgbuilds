# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-trio
pkgver=0.26.0
pkgrel=1
pkgdesc='A friendly Python library for async concurrency and I/O'
arch=(any)
url=https://github.com/python-trio/trio
license=(MIT)
depends=(
  python
  python-attrs
  python-idna
  python-outcome
  python-sniffio
  python-sortedcontainers
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-setuptools
  python-installer
  python-wheel
)
checkdepends=(
  python-astor
  python-black
  python-isort
  python-jedi
  python-pylint
  python-pytest
  python-ruff
  python-trustme
)
provides=(python-multio-provider)
_tag=e2e05210fea0f7db1c0225a3c46a77c58d98e025
source=(git+https://github.com/python-trio/trio.git#tag=${_tag})
b2sums=('5cdc0fb5eca0d05c05a32fe218079d3815d864750e6beda34728533460a69e6b152e7ad7fdd1edecbcf66b70e527589c6317ac843410c7eaece366ce7bc3a5c9')

pkgver() {
  cd trio
  git describe --tags | sed 's/^v//'
}

build() {
  cd trio
  python -m build --wheel --no-isolation
}

check() {
  cd trio
  PYTHONPATH=$PWD/src pytest -vv
}

package() {
  python -m installer --destdir="${pkgdir}" trio/dist/*.whl
  install -Dm 644 trio/LICENSE -t "${pkgdir}"/usr/share/licenses/python-trio/
}

# vim: ts=2 sw=2 et:
