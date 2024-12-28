# Maintainer: David Runge <dvzrv@archlinux.org>

_name=rcssmin
pkgname=python-rcssmin
pkgver=1.1.3
pkgrel=2
pkgdesc="Fast CSS minifier for Python"
arch=(x86_64)
url="https://github.com/ndparker/rcssmin"
license=(Apache-2.0)
depends=(
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('8d78bb46b6a409fdfa78f167c0338b3d584d05e7e0fe5269ce95af5949b205d2f9c1fb88a16f08a5f5e02fa18415dea445414ffe41d33fd815759632e3515ef5')
b2sums=('67073bba60f624a928ec7103e99677c0bd95642bba80b3a20f9b975eac16f0665d201d26f1b986460a8653686e5c64b269ce853eb23b0606560fb05e11def8de')

build() {
  cd $_name-$pkgver
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
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
