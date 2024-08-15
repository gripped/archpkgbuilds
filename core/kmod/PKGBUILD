# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=kmod
pkgver=33
pkgrel=1
pkgdesc="Linux kernel module management tools and library"
arch=('x86_64')
url='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
license=('LGPL-2.1-or-later' 'GPL-2.0-or-later')
depends=('glibc' 'zlib' 'openssl' 'xz' 'zstd')
makedepends=('scdoc')
checkdepends=('linux-headers' 'libelf')
options=('strip')
provides=('module-init-tools=3.16' 'libkmod.so')
conflicts=('module-init-tools')
replaces=('module-init-tools')
validpgpkeys=('EAB33C9690013C733916AC839BA2A5A630CBEA53')  # Lucas DeMarchi
source=("https://www.kernel.org/pub/linux/utils/kernel/${pkgname}/${pkgname}-${pkgver}.tar."{xz,sign}
        '0001-test-user-path.patch'
        'depmod-search.conf'
        'depmod.hook'
        'depmod.script')
md5sums=('c451c4aa61521adbe8af147f498046f8'
         'SKIP'
         '0360aff69475ebf35b1e85eac2602708'
         'dd62cbf62bd8f212f51ef8c43bec9a77'
         'e179ace75721e92b04b2e145b69dab29'
         'b00253ca0d4ebfb2414e4596597bdebd')
sha256sums=('dc768b3155172091f56dc69430b5481f2d76ecd9ccb54ead8c2540dbcf5ea9bc'
            'SKIP'
            '1297d45ba9cabb88edecebdbf4431b7b384bbab976d117d5ef1f44988a04895d'
            '1a92bfeae870f61ce814577e69d2a147a9c0caf6aed1131243e4179241fcc4a8'
            'c11c2a0f66ea405493e8617689ca10818dc81dd1dddc19bdb220c8b2917119c1'
            'd2cd04a09feba30e1376144a8110ec7521892acb0940c3c4ba459aeecf0452ed')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 < ../0001-test-user-path.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure \
    --sysconfdir='/etc' \
    --with-module-directory='/usr/lib/modules' \
    --with-xz \
    --with-zlib \
    --with-zstd \
    --with-openssl

  make
}

check() {
  # As of kmod v20, the test suite needs to build some kernel modules, and thus
  # needs headers available in order to run. We depend on linux-headers, but
  # this is really only to try and make sure that *some* useable tree of kernel
  # headers exist. The first useable tree we find is good enough, as these
  # modules will never be loaded by tests.

  local kdirs=(/usr/lib/modules/*/build/Makefile)
  if [[ ! -f "${kdirs[0]}" ]]; then
    printf '==> Unable to find kernel headers to build modules for tests\n' >&2
    return 1
  fi

  local kver kdir="${kdirs[0]%/Makefile}"
  IFS=/ read _ _ _ kver _ <<<"${kdir}"

  make -C "${pkgname}-${pkgver}" check KDIR="${kdir}" KVER="${kver}"
}

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install

  # extra directories
  install -dm0755 "${pkgdir}"/{etc,usr/lib}/{depmod,modprobe}.d

  # install depmod.d file for search/ dir
  install -Dm0644 "${srcdir}/depmod-search.conf" "${pkgdir}/usr/lib/depmod.d/search.conf"

  # hook
  install -Dm0644 "${srcdir}/depmod.hook" "${pkgdir}/usr/share/libalpm/hooks/60-depmod.hook"
  install -Dm0755 "${srcdir}/depmod.script" "${pkgdir}/usr/share/libalpm/scripts/depmod"
}

# vim: ft=sh syn=sh et
