# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=python-pytools
pkgver=2026.1
pkgrel=1
pkgdesc="A collection of tools for Python"
arch=(any)
url="https://github.com/inducer/pytools"
license=(MIT)
depends=(
  python
  python-platformdirs
  python-siphash24
  python-typing_extensions
)
optdepends=('python-numpy: NumPy-related functionality')
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-attrs
  python-numpy
  python-pytest
)
source=("git+https://github.com/inducer/pytools.git#tag=v$pkgver")
sha512sums=('019a09ef775c6c2f907734173dfd8688057ad0a400f7bf1e08ed8a20e163b282e2bd86855d7690a36d852221c448eef654ea49bd46db05a424a484748ae0ec9c')

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
