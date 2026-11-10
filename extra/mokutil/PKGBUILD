# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
pkgname=mokutil
pkgver=0.7.2
pkgrel=3
pkgdesc="Shim.efi Machine Owner Key management tool"
arch=(x86_64)
url="https://github.com/lcp/mokutil"
license=('GPL-3.0-or-later')
depends=(efivar openssl keyutils libxcrypt)
makedepends=(git)
source=("git+https://github.com/lcp/mokutil#tag=$pkgver"
        "openssl-4.patch::https://src.fedoraproject.org/rpms/mokutil/raw/d530b8a8faa26b3267b5d11c9f0fb2fc8cf483a1/f/0003-Fix-OpenSSL-4.0-compatibility.patch")
b2sums=('8fc3481b293c5534a354322420e81e5b3f6dd26c3528d2a8792c6d66343c71e093e758f40603465dbf246fed0ba7b229ce7b0ba2cc28229162a00f2ce907e33e'
        '0e35ae932dc989191e9db1ae7b721df072a31096d2a7c74e4c40671db01902f41badf86c9627709c31c0d8b0bb9fb9964588e1a37d5bdeaf77f6640c9364fe49')

prepare() {
  cd "${pkgname}"
  # mokutil: remove unused int_to_b64()
  git cherry-pick -n ea98ef56fa64e088d968a10c7bc751492abe672f
  patch -Np1 -i ../openssl-4.patch
  autoreconf -f -i
}

build() {
  cd "${pkgname}"
  # Keep OpenSSL 4.1 deprecations as warnings, matching upstream's release default.
  ./configure \
    --disable-strict \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
}

