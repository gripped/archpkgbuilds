# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=lib32-ocl-icd
_pkgname=ocl-icd
pkgver=2.3.3
pkgrel=1
pkgdesc="OpenCL ICD Bindings (32-bit)"
arch=('x86_64')
url="https://github.com/OCL-dev/ocl-icd"
license=('BSD')
depends=('lib32-glibc')
makedepends=('ruby' 'lib32-mesa' 'opencl-headers>=2.1' 'gcc-multilib')
checkdepends=()
provides=('lib32-opencl-icd-loader')
conflicts=('lib32-libcl')
replaces=('lib32-libcl')
optdepends=('lib32-opencl-driver: packaged opencl driver')
source=("ocl-icd-${pkgver}.tar.gz::https://github.com/OCL-dev/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8cd8e8e129db3081a64090fc1252bec39dc88cdb7b3f929315e014b75069bd9d')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  autoreconf -fiv
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir"/usr/{share,include,bin}
  install -m755 -d "$pkgdir/usr/share/licenses/lib32-ocl-icd"
  install -m644 "$srcdir/$_pkgname-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/lib32-ocl-icd/"
}

# vim:set ts=2 sw=2 et:
