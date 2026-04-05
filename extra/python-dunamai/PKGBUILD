# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dunamai
pkgver=1.26.1
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
sha512sums=('c8d57b58e23b1c985c5a4443ab9da094e8e3fd2bd9c630887be6c45af1c37d66b31ecf7119e03d34755c523b85925d39f019a3e37548942a784176fbe0dbf892')
b2sums=('8f52681321c083eaf56c0e01cd773454c3dab67705417766bdd82fcd8ec5b443b2855d4fbcb14a21954b6665a0dc2a9fae4d0a9071e910088be7385bf0faeb0c')

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
