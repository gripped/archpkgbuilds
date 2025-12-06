# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.20
pkgrel=1
pkgdesc='Python library for parsing, formatting, storing and validating phone numbers'
arch=(any)
url='https://github.com/daviddrysdale/python-phonenumbers'
license=(Apache-2.0)
depends=(python)
makedepends=(git
  python-setuptools
  python-build
  python-installer
  python-wheel
)
checkdepends=(python-protobuf)
source=("git+https://github.com/daviddrysdale/python-phonenumbers.git#tag=v$pkgver")
sha512sums=('86ff2d9dc8f6d1caf73cf4b0e936bdcf82229a5c10b689ddc0783e1ddec14575f5a3124cd82474badf1dd505961589c96c9de29f674d2b9ef48800e1783a8859')
b2sums=('0dd8de5cd8ff6db19dd45a637fedfcae87c95d025bc83b781d47dc256a2fdb506f441acdd7bac072776bd94188f9404e62c26d72411c69f3ebb04f17fb083f15')

build() {
  cd "$pkgname"

  # Regenerate the protobuf files
  rm python/phonenumbers/pb2/phonenumber_pb2.py
  pushd tools/python
  make pb2
  popd

  cd python
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname/python"

  python -m unittest -v
}

package() {
  cd "$pkgname/python"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
