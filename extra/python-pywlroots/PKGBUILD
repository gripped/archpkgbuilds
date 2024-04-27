# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pywlroots
pkgname=python-pywlroots
pkgver=0.16.7
pkgrel=2
pkgdesc="Python binding to the wlroots library using cffi"
arch=(x86_64)
url="https://github.com/flacjacket/pywlroots"
license=(NCSA)
depends=(
  glibc
  python
  python-cffi
  python-pywayland
  python-xkbcommon
  wlroots0.16
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
provides=(pywlroots)
conflicts=(pywlroots)
replaces=(pywlroots)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('fbc8e85aed6915eb6ffcf9c994fd2deaff5ca3744a8ff57fbe1eb14e3d5616fd3b785f270697a85a8f5b9bca6a43932718efc6b520cf5c29f2d7e6b581b4f6a4')
b2sums=('a0e3d5b08076c702607ba9fce1094807ba5c48d7659ecdc2e6e8884dcc31591905839db3beba386ad37d4c88bbb87fa975e9bf74adba58174d0446b94ba4a28a')

build() {
  export CFLAGS="$CFLAGS -I/usr/include/wlroots0.16"
  export LDFLAGS="$LDFLAGS -L/usr/lib/wlroots0.16"
  cd $_name-$pkgver
  python wlroots/ffi_build.py
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
