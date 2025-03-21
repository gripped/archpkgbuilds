# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dunamai
pkgver=1.23.1
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
sha512sums=('170b93cea2ab4d487e9fd979831a60e182eede283d446eebc1483ce1575fdfa6f4e33b82bf2d52de2956a312a6ad4c7ff343c801df6aa20a81788380a6152b6d')
b2sums=('f5c2b5695e452443b9e6348458a78f7b6db4baa4567d4dbd35763d47bf8c67057938a36a737a728695ca150b706cf376f09b46bb180ae6bd74fc669bbacc3873')

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

  # run tests, skipping annoying ones that require messing with global git config
  pytest -v \
    --deselect tests/integration/test_dunamai.py::test__version__from_git__with_annotated_tags \
    --deselect tests/integration/test_dunamai.py::test__version__from_git__with_lightweight_tags \
    --deselect tests/integration/test_dunamai.py::test__version__from_git__with_mixed_tags \
    --deselect tests/integration/test_dunamai.py::test__version__from_git__with_nonchronological_commits \
    --deselect tests/integration/test_dunamai.py::test__version__from_git__gitflow \
    --deselect tests/integration/test_dunamai.py::test__version__from_git__exclude_decoration \
    --deselect tests/integration/test_dunamai.py::test__version__from_git__broken_ref
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
