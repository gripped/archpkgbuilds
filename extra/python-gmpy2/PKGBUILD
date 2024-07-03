# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Omar Sandoval <osandov at cs dot washington dot edu>
# Contributor: Alexander Slesarev <slesarew at gmail dot com>

pkgname=python-gmpy2
pkgver=2.2.0
pkgrel=1
pkgdesc='Provides C-coded Python modules for fast multiple-precision arithmetic'
arch=(x86_64)
url='https://github.com/aleaxit/gmpy'
license=(LGPL-2.1-only)
depends=(glibc
         gmp
         libmpc
         mpfr
         python
         python-packaging)
makedepends=(git
             python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-hypothesis
              python-pytest)
source=(git+https://github.com/aleaxit/gmpy#tag=gmpy2_${pkgver//./_})
sha256sums=('51b1d6d444335d8fb86e5d2125014c6dad8d0bc2d3016d242a71e8427b1e47d8')

build() {
  cd gmpy
  python -m build --wheel --no-isolation
}

check() {
  cd gmpy
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  rm -r gmpy2
  test-env/bin/python -m pytest -v
}

package() {
  cd gmpy 
  python -m installer --destdir="$pkgdir" dist/*.whl
 
  install -d -m 755 $pkgdir/usr/share/doc/$pkgname
  install -m 644 -t $pkgdir/usr/share/doc/$pkgname docs/*
}
