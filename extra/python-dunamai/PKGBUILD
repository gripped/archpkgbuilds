# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dunamai
pkgver=1.25.0
pkgrel=2
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
sha512sums=('826f6c4adcb76a79f25ab8ff2f0ed7fccc579687baaa73b9053708eed36674f1bd1a62dae84fc6bd4e4f3b927088962900e1d5e0123fe3a609ff4714498d5c38')
b2sums=('bad2f992467e78c6c6c50926561c514363043f8f34f6bf71a4123e9034c5400260309200b7d78f42640fbe79735f0faa88e2e33032ee89f69f39b41390304819')

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
