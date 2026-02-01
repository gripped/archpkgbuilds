# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-phonenumbers
pkgver=9.0.23
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
sha512sums=('2c75fa8458af94b494afde502a3d668f5899522238c80a355a6762bdfd6376e9143a9f2799397edc47cc97858d0e5ddf72c3c6788a49be073669ee80a6595c51')
b2sums=('d4b772ba4f9cd80f3331e13f96d69c2b2b2a6af8e6b47f900573dc9c1d3ba7ee66aad0edf5226ddeb806f7c3fb02a1f35f78b104ecde7030fac03c5aa52aed09')

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
