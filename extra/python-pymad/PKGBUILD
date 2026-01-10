# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Mark Rosenstand <mark@archlinux.org
# Contributor: Corrado Primier <cp663137@stud.polimi.it>

pkgname=python-pymad
pkgver=0.11.3
pkgrel=3
pkgdesc='Python interface to libmad'
arch=(x86_64)
url='https://github.com/jaqx0r/pymad'
license=(LGPL-2.0-only)
depends=(libmad python)
makedepends=(git python-setuptools python-setuptools-scm)
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('c8d9b4a265bacc7c61cbd2a4125e697f76292627d48b00a3fb3aa6b208ea0ee2f8a95cb0ed8bb8e33d8e85c12bf1a770f6ed565b175c7d34d67de3edf8afc0a3')

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir"
}
