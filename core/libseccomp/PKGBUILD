# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws>
# Contributor: RocketDev <ma2014119@outlook.com>

pkgbase=libseccomp
pkgname=(libseccomp python-libseccomp)
pkgver=2.6.2
pkgrel=1
pkgdesc='Enhanced seccomp library'
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/seccomp/libseccomp"
checkdepends=(
  valgrind
)
makedepends=(
  cython
  git
  glibc
  gperf
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(git+https://github.com/seccomp/libseccomp.git#tag=v${pkgver}?signed)
sha256sums=('d50fd20cecea0e8bb4b0cb3bd5c485c86886bbc3cbc8bd60a38ed3870e3b3b85')
b2sums=('9aa7ae359863b9874b19e904f1c0d32f910a4a70cab852d153222e995745a02797af456b8bc12b28925d58a34a5b531ef472834a88a19e1d5d873abc15ae2185')
validpgpkeys=(
  '7100AADFAE6E6E940D2E0AD655E45A5AE8CA7C8A' # Paul Moore <paul@paul-moore.com>
  '47A68FCE37C7D7024FD65E11356CE62C2B524099' # Tom Hromatka <tom.hromatka@oracle.com>
)

prepare() {
  cd ${pkgbase}
  autoreconf -fiv
}

build() {
  cd ${pkgbase}
  ./configure --prefix=/usr
  make
  cd src/python
  VERSION_RELEASE=${pkgver} CPPFLAGS="$CPPFLAGS -I${srcdir}/${pkgbase}/include" python -m build --wheel --no-isolation
}

check() {
  cd ${pkgbase}
  make check
}

package_libseccomp() {
  depends=(glibc)
  provides=(libseccomp.so)
  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 CHANGELOG README.md SECURITY.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

package_python-libseccomp() {
  depends=(python glibc)
  cd ${pkgbase}/src/python
  env VERSION_RELEASE=${pkgver} python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
