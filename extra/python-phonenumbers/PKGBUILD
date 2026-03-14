# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.26
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
sha512sums=('46a7c93274bc04dc02021354fba78e18992a4da98e4fedd00cb2584e4bd8e082a916f997e109b9bf9b5c71fb5e8f9b645af963992f3c6e80789c20c1b0555f6f')
b2sums=('738c086d71c97257bbd2ad2f5f57d9293bdd84d4d61878bb562e1963fe385c4692a2da731f9b1e32a0d1ef65924cd9d44f649618bcad449ae4a60e41d72dd759')

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
