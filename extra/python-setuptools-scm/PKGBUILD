# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-setuptools-scm
pkgver=10.2.2
pkgrel=1
pkgdesc='Handles managing your python package versions in scm metadata'
arch=(any)
url=https://github.com/pypa/setuptools-scm
license=(MIT)
depends=(
  python
  python-packaging
  python-setuptools
  python-vcs-versioning
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  mercurial
  python-pip
  python-pytest
  python-pytest-timeout
  python-rich
)
checkdepends_riscv64=(
  libxml2
  libxslt
)
optdepends=(
  'python-rich: use rich as console log handler'
)
source=("$pkgname::git+$url.git#tag=setuptools-scm-v$pkgver")
sha512sums=('61e1b488d9c2af0b5c28501be4dd5b9e383f0baf07a1c27d83cc20c9af1f0ed92910ba661e7e597408b9c98a695e87c0814238382bbe16c94b3e3b0b3602c958')
b2sums=('b53e406f84fa69bec7959394d8b5ca965fb56c9bfb26534368b14c0e7fb92e88d8146ef19bc4f86c6e678f306d37c775c5c3a7341bc4bf6020f15c18ae6996d9')

build() {
  cd "$pkgname/setuptools-scm"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname/setuptools-scm"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  local pytest_opts=(
    -v
    -k 'not test_not_owner'
    --deselect testing_scm/test_basic_api.py::test_get_version_blank_tag_regex
    --deselect testing_scm/test_integration.py::test_setuptools_version_keyword_ensures_regex
  )

  pytest "${pytest_opts[@]}"
}

package() {
  cd "$pkgname/setuptools-scm"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
