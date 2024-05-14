# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-trio
_name=${pkgname#python-}
pkgver=0.25.0
pkgrel=3
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
source=(git+$url.git#tag=v$pkgver)
b2sums=('9bbb93dee455fd2a48d2199ff2b3faf964a71fb33116fecbd82a2edca05e747ac619a737f303242873884cb543c5a891f13eac1b4da5cbc9467c8ef4919fd047')

build() {
  cd trio
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  PYTHONPATH=$PWD/src pytest -vv
}

package() {
  python -m installer --destdir="${pkgdir}" trio/dist/*.whl
  install -Dm 644 trio/LICENSE -t "${pkgdir}"/usr/share/licenses/python-trio/
}

# vim: ts=2 sw=2 et:
