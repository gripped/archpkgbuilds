# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-trio
pkgver=0.31.0
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
  python-yaml
)
provides=(python-multio-provider)
_tag=94b7244505212061e21507c84725ef28be2705dd
source=(git+https://github.com/python-trio/trio.git#tag=${_tag})
b2sums=('1bde7bdf18c6285544532d4298ccdbe60c447d7651e4767086f717b740441c01edac25cc1c31f2f4236c74dd04bd6b75a9db4277e528978b404c186733ed5a00')

prepare() {
  sed '/"error",/d' -i trio/pyproject.toml # don't treat test warnings as errors
}

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
