# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-pkginfo
_pkgname="${pkgname#python-}"
pkgver=1.13
pkgrel=1
pkgdesc='Query metadata from sdists / bdists / installed packages'
arch=(any)
url='https://pypi.python.org/pypi/pkginfo'
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(
  python-pytest
  python-packaging
  python-wheel
)
source=(
  "$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/p/pkginfo/pkginfo-$pkgver.tar.gz"
  remove-pkg_resources.patch
)
sha512sums=('f8c1451f5cb1b7ce1ea95b3eec2d7b24103e96d472b9c76e93fc8993d0272611424cf01bd002f4714984be2bb8b7d0ff907f0c536baf825cb107a2b6f806e5f8'
            'b568f86ed50c02f6f6c08b5f79327d9729278a4677d117a2b1f255951c281e0348d24eeb23bde87b9a40e60d684620bec95c404f013e6756c8cee89aec575f8f')
b2sums=('2d8d6ac3a03f920fb9b1567e832291e8abed92ea7d0c8e0dd4613ddeeaa0841f3014ef52ceab2a26000924051ba3666721b7bed093e8700f3353975157fe2d5d'
        'e7ef432acb7db3f16dc9f6b011a713dfe4ac281ff5a895d18d7b287360cd4281e18650a0b3a153e7aa58a3d05c874fe8a8e26b6b12a83df012d0e915c675dbf3')

prepare() {
  cd "$_pkgname-$pkgver"

  patch -p1 -i "$srcdir/remove-pkg_resources.patch"
}

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  local pytest_options=(
    -vv
    # HACK: needs upstream big report
    -k 'not test_installed_ctor_w_dist_info'
    --deselect tests/checkers.py
    # ?
    --deselect pkginfo/tests/test_installed.py::test_installed_ctor_w_package
    --deselect pkginfo/tests/test_installed.py::test_installed_ctor_w_package_and_metadata_version
    --deselect pkginfo/tests/test_installed.py::test_installed_ctor_w_name
    --deselect pkginfo/tests/test_installed.py::test_installed_ctor_w_name_and_metadata_version
    --deselect pkginfo/tests/test_utils.py::test_get_metadata_w_module
    --deselect pkginfo/tests/test_utils.py::test_get_metadata_w_module_and_metadata_version
    --deselect pkginfo/tests/test_utils.py::test_get_metadata_w_package_name
    --deselect pkginfo/tests/test_utils.py::test_get_metadata_w_package_name_and_metadata_version
  )
  pytest "${pytest_options[@]}"
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
