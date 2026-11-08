# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dunamai
pkgver=1.26.4
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
sha512sums=('222ac328c661349195cedc3e82d7ad8ea4c9066e210e5364c5b94f3b1b523083c7a0b9573c0a3b947bcb99d16a76bedd3a097da6324f1384b174fe2fccfaba5a')
b2sums=('80001d390ad4a6c1bc799ff0731056f540bd053d78dc49c4fc21226f42874bd3dfbdb382374da9cff67612c0bc694be2bdca8aecef8f18eb03432da116cefc71')

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
