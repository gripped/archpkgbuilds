# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=jrnl
pkgver=4.3
pkgrel=1
pkgdesc="Collect your thoughts and notes without leaving the command line"
arch=('any')
url="https://jrnl.sh/"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-colorama'
  'python-cryptography'
  'python-dateutil'
  'python-keyring'
  'python-parsedatetime'
  'python-pyxdg'
  'python-rich'
  'python-ruamel-yaml'
  'python-tzlocal'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-pytest'
  'python-pytest-bdd'
  'python-pytest-xdist'
  'python-toml'
)
_url=https://github.com/jrnl-org/jrnl
source=("git+$_url#tag=v$pkgver")
b2sums=('d5d1fce780510e714b18e4784e8c9855bb13eba3f91a02509a569969e37ec69cf89411b61f17482f1579dc273945a498a6eb54eefdd754a6036dbee913fc4935')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  # Deselected tests fail due to v-prefixed version mismatch:
  # https://github.com/jrnl-org/jrnl/issues/2065
  pytest \
    --deselect tests/bdd/test_features.py::test_displaying_the_version_number \
    --deselect tests/bdd/test_features.py::test_install_jrnl_with_custom_expanded_default_journal_path \
    --deselect tests/bdd/test_features.py::test_install_jrnl_with_custom_relative_default_journal_path \
    --deselect tests/bdd/test_features.py::test_install_jrnl_with_default_options \
    --deselect tests/bdd/test_features.py::test_install_jrnl_with_encrypted_default_journal \
    --deselect tests/bdd/test_features.py::test_install_jrnl_with_encrypted_default_journal_with_no_entries \
    --deselect tests/bdd/test_features.py::test_update_version_number_in_config_file_when_running_newer_version
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
