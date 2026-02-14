# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: minder

pkgname=python-pillow
pkgver=12.1.1
pkgrel=1
pkgdesc='Python Imaging Library (PIL) fork'
arch=(x86_64)
url='https://pillow.readthedocs.io'
license=(MIT-CMU)
depends=(
  glibc
  python
  python-packaging
  freetype2
  lcms2
  libavif
  libraqm
  libtiff
  openjpeg2
  libjpeg-turbo
  libimagequant
  libxcb
  zlib
)
makedepends=(
  git
  pybind11
  python-build
  python-installer
  python-wheel
  python-setuptools
  libwebp
  tk
)
checkdepends=(
  python-pytest
  python-pytest-timeout
)
optdepends=(
  'libwebp: for webp images'
  'tk: for the ImageTK module'
  'python-olefile: OLE2 file support'
  'python-pyqt6: for the ImageQt module'
  'python-defusedxml: for reading XMP tags'
)
source=(
  "$pkgname::git+https://github.com/python-pillow/Pillow#tag=$pkgver"
)
sha512sums=('f4ccccd436fb1afd8a61091b3b34e87a13dd2b9109f442bd2136107cbcd788ce5fcb3064db7e433e732d0f2f82e7e66e031226c279a34b73c47d53f1f9fdaef9')
b2sums=('fb76a96aa93793095548e60dfffea8a1a7e0f4eff94a85f3cb344a101cdf38ab28d55f940f4f3f8e312ddf0514969380ef747c76b9032109423ba7bd3ad3b1a8')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python selftest.py
  test-env/bin/python -m pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  install -vDm644 -t "$pkgdir/usr/include/python$python_version" src/libImaging/*.h

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
