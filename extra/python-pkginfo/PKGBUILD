# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-pkginfo
_pkgname="${pkgname#python-}"
pkgver=2.0
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
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/p/pkginfo/pkginfo-$pkgver.tar.gz")
sha512sums=('d70329f5039d78ccf984bf7f556925046cf07852aac1d183f0d925878fc3ed3872283df61aeaf0ca1b9e4b90ba9eba012fd9b57edb547b43b7b08929d2dbeeec')
b2sums=('daaf508c9b90cc6c71d8fce86f728065e811f368a9642f184abe7d2374162658f1c3856b6338b1255c785c3aa8c8a0fe2792a9c6e7a9cc6470e50306daeb1eca')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

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
