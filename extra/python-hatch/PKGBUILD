# Maintainer: Santiago Torres-Arias <santiago @ usualplace>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Phillip A. (flying-sheep)

pkgname=python-hatch
pkgver=1.14.2
pkgrel=1
pkgdesc="A modern project, package, and virtual env manager"
arch=('any')
url="https://github.com/pypa/hatch"
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-hatchling'
  'python-httpx'
  'python-hyperlink'
  'python-keyring'
  'python-packaging'
  'python-pexpect'
  'python-platformdirs'
  'python-rich'
  'python-shellingham'
  'python-tomli-w'
  'python-tomlkit'
  'python-userpath'
  'python-uv'
  'python-virtualenv'
  'python-zstandard'
)
makedepends=(
  'python-build'
  'python-hatch-vcs'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'git'
  'libxcrypt-compat'
  'python-pyfakefs'
  'python-pytest'
  'python-pytest-mock'
  'rust'
)
source=("$url/archive/hatch-v$pkgver.tar.gz")
sha256sums=('6e50f68dcfe03add2f431c692e29e27fc81cb1e6f589d2f39af091355db8c537')

build() {
  cd hatch-hatch-v$pkgver
  python -m build --wheel --no-isolation

  # Create test environment here to be able to use it for creating completion
  # scripts.
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  _HATCH_COMPLETE=bash_source test-env/bin/python -m hatch > completion.bash
  _HATCH_COMPLETE=fish_source test-env/bin/python -m hatch > completion.fish
  _HATCH_COMPLETE=zsh_source test-env/bin/python -m hatch > completion.zsh
}

check() {
  cd hatch-hatch-v$pkgver
  # Don't run hatchling tests, the tests in the tagged version of hatch are not
  # in sync with the tagged version of hatchling.
  test-env/bin/python -m pytest --ignore=tests/backend \
    --deselect=tests/cli/build/test_build.py::test_clean \
    --deselect=tests/cli/build/test_build.py::test_clean_env_var \
    --deselect=tests/cli/build/test_build.py::test_clean_hooks_after \
    --deselect=tests/cli/build/test_build.py::test_clean_hooks_after_env_var \
    --deselect=tests/cli/build/test_build.py::test_default \
    --deselect=tests/cli/build/test_build.py::test_explicit_directory \
    --deselect=tests/cli/build/test_build.py::test_explicit_directory_env_var \
    --deselect=tests/cli/build/test_build.py::test_plugin_dependencies_unmet \
    --deselect=tests/cli/config/test_set.py::test_project_location_basic_set_first_project \
    --deselect=tests/cli/config/test_set.py::test_project_location_complex_set_first_project \
    --deselect=tests/cli/self/test_self.py::test
}

package() {
  cd hatch-hatch-v$pkgver
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt

  install -vDm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/hatch"
  install -vDm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/hatch.fish"
  install -vDm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_hatch"
}
