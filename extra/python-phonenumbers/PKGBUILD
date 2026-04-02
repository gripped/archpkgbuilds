# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.27
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
sha512sums=('006410ef45b3e002fe19c866641cd3fa16bebb0cd45476ea3eb2e99b294091264fb53b09612821c84c47da29ae20d499510cb30422a8d3663cda5ae75a8294e6')
b2sums=('f273f1ac6f57532db8d6f96108ce1400cc2b4c4ef5da916e5076841e886f1280ab1069b7638cb86430d3d4573da539970032de27d081da4f929d61c10e95c7df')

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
