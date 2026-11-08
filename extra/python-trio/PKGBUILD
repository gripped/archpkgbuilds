# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-trio
pkgver=0.35.0
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
  python-pytest
  python-ruff
  python-trustme
  python-yaml
)
provides=(python-multio-provider)
source=(git+https://github.com/python-trio/trio.git#tag=v${pkgver})
b2sums=('8d6d8384ebc621e26eb716a626cdba0455d1bcb63e56b8a0808f83bda8762984874db1f8bf5a3cf04fa5cc419fa3e198505415a5caca472d2ff84bdfb7babe79')

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -W=ignore::DeprecationWarning \
    -m "not redistributors_should_skip" \
    --deselect=src/trio/_tests/tools/test_gen_exports.py::test_run_ruff
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
  # don't ship the test suite or dev tools
  rm -rf \
    "$pkgdir"/usr/lib/python*/site-packages/trio/_tests \
    "$pkgdir"/usr/lib/python*/site-packages/trio/_tools \
    "$pkgdir"/usr/lib/python*/site-packages/trio/_core/_tests
  install -vDm644 -t "$pkgdir/usr/share/licenses/python-trio" LICENSE
}

# vim: ts=2 sw=2 et:
