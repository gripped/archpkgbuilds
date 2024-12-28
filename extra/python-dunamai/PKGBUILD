# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dunamai
pkgver=1.23.0
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
sha512sums=('7b1aab135004053f03d53f2197d0b0752446bf424e1746ff7ed6def0cae9463847284586f25a0afb40f7195ad7f8c5a9698c169a986d7f33e6b0d341ffd64bd9')
b2sums=('5f7dbaf61fb73ee324d9d6b1fdc64040d56d4a848e66cbbba2bf86d79eba6ea3f83474c5a4c5266aa82e2cfc696c00ee177e816b58395c9517c13109548dfb44')

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

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/${pkgname#python-}-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
