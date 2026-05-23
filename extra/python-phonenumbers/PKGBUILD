# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.31
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
sha512sums=('9f7573b45c1c2c8ecf720f9afb9e5698b64e0c599d5a6b4c668a33378c09b01906233ec81e292943808ea809b8dea775d50cbfbafbe1ab462dfbe19e1ffdb6da')
b2sums=('8154b4a02abfd41102fca17272ffba252bcf27e0395172969a89ca3e31a267db731e4d21425991ac5c1dc9f00d718bae8c9431f28bf0535379eadc47aa23e5ed')

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
