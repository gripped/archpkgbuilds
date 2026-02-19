# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dunamai
pkgver=1.26.0
pkgrel=1
pkgdesc='A library for producing dynamic version strings, derived from VCS tags'
arch=('any')
url='https://github.com/mtkennerly/dunamai'
license=('MIT')
depends=(
  'python'
  'python-packaging'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=('python-pytest' 'python-setuptools')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('0673246571d5e8b4e4b5ad596d33ab76aeeb03ea8b3b4d03c531c4743b8737bfc8ddf2e409b5278ff4a5e1ccb2eb9c41107295057b0129b73ef9af75776ea0e8')
b2sums=('4c8953c3f0e063247793ad0cf90cc959c066f5d554fedf0e589dc83a0f6d511d0f80a0883a088f6c74f28e4a0f5558bb0052ec5462475573e208757cb8b45359')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install so that:
  # * pkg_resources can pick up the package
  # * the required binary can be added to $PATH
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PATH="$(pwd)/tmp/usr/bin:$PATH"
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  # skip tests that require messing with global git config
  local deselected=(
    tests/integration/test_dunamai.py::test__version__from_git__with_annotated_tags
    tests/integration/test_dunamai.py::test__version__from_git__with_lightweight_tags
    tests/integration/test_dunamai.py::test__version__from_git__with_mixed_tags
    tests/integration/test_dunamai.py::test__version__from_git__with_nonchronological_commits
    tests/integration/test_dunamai.py::test__version__from_git__gitflow
    tests/integration/test_dunamai.py::test__version__from_git__exclude_decoration
    tests/integration/test_dunamai.py::test__version__from_git__broken_ref
    tests/integration/test_dunamai.py::test__version__from_git__trace_env_var
    tests/integration/test_dunamai.py::test__version__from_git__initial_commit_empty_and_tagged
  )

  pytest -v ${deselected[@]/#/--deselect }
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
