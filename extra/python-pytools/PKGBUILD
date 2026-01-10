# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=python-pytools
pkgver=2025.2.5
pkgrel=2
pkgdesc="A collection of tools for Python"
arch=(any)
url="https://github.com/inducer/pytools"
license=(MIT)
depends=(
  python
  python-numpy
  python-platformdirs
  python-siphash24
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-attrs
  python-pytest
)
source=("git+https://github.com/inducer/pytools.git#tag=v$pkgver")
sha512sums=('0d2106e5cbb921e43b4060509e68a905181c17a9bf6dff6d9b0c0f7a0f3906767c86d745be6ae636b2b0b9d7031a9506dfe7d4f707498d5572ce80e600695ee6')

build() {
  cd pytools
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -W ignore::DeprecationWarning
  )

  cd pytools
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}"
}

package(){
  cd pytools
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
