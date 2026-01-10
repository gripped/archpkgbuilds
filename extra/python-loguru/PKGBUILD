# Maintainer: David Runge <dvzrv@archlinux.org>

_name=loguru
pkgname=python-loguru
pkgver=0.7.3
pkgrel=2
pkgdesc="Python logging made (stupidly) simple"
arch=(any)
url="https://github.com/Delgan/loguru"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-flit-core
  python-installer
)
checkdepends=(
  python-colorama
  python-freezegun
  python-pytest
)
source=(
  $_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  $_name-0.7.3-update_mypy_deps.patch::https://github.com/Delgan/loguru/commit/8bba363a12483b419a27f17212b9368bc3105677.patch
  $_name-0.7.3-disable_mypy_tests.patch::https://github.com/Delgan/loguru/commit/e17479bd0701e8fc0b26981339540599dc224d11.patch
  $_name-0.7.3-fix_exception_modern.patch::https://github.com/Delgan/loguru/commit/84023e2bd8339de95250470f422f096edcb8f7b7.patch
)
sha256sums=('1cad8860aa0ecf9567125381e4430046526246e075224350a6a624addac05f5e'
            '620fd00249a6bdee1002ec8683525a13b5cd33fd61989c8f5c976b0565e62810'
            '0c2724a1435fa393a3202c1b40bf9acdaf97963abb24ca1758f8773684da348d'
            '29f9635d9d2bdc5f8daa363cd3092e654783027b6d8dc10d6c23695a4d4d0dbb')
b2sums=('7d7cf167e1350814eea6a358cc00bac217ea6b153ae29ffd70c026f3be63cc126fbc184668ea643ea03416fc8f805bd51502fd8cc9e8d9bcc19099814b8c3fe6'
        '01e82e4c5c9503ca58e366942622839ba1ec5ce0bc2ce3d598f2583eb047805e189f4d2bef696fbb097ee13f7f3a354911fb4e8d000ae05df78f3bdfd0bfe086'
        '5101e0d1f5c2ea1f53e1783ec6f239abc35e334b86b7574b68f3da53515a07c0fc0312eb4bca0006f85c88a9a9d6e962e6a42e998eca1670c61575d0180a47ab'
        '00f891c0ef8929ea69cc624805e1abe60c91d3e0c0c03fddca55ea2e98e0bf0243a66ae8648ccff8f1d25fb3f7d7a3e4e24168396731f3dc6ecff4d95789feda')

prepare() {
  patch -Np1 -d $_name-$pkgver -i ../$_name-0.7.3-update_mypy_deps.patch
  patch -Np1 -d $_name-$pkgver -i ../$_name-0.7.3-disable_mypy_tests.patch
  patch -Np1 -d $_name-$pkgver -i ../$_name-0.7.3-fix_exception_modern.patch
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --ignore tests/test_type_hinting.py  # we don't care about type hints
  )

  cd $_name-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
