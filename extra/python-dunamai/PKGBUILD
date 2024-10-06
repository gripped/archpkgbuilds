# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dunamai
pkgver=1.22.0
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
sha512sums=('67092f6d7d5774f66ec5ae29cf0cbd4f71bc54383d906488c6da4c5655a71db2ace57b952ccd3bc17c9fb6955843b71764fc31456f1da3f02bc23d0a71eb4af3')
b2sums=('2256820ff2525fd61d2a0fcaef3bec497c869d5499f5a3eea6902c948922601f028674740198b1bef5aa699fca4f800916c09b779242870616ce007a0c3a64ea')

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
