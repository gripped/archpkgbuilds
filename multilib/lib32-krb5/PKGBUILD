# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Florian Pritz <flo@xinu.at>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_pkgbasename=krb5
pkgname=lib32-${_pkgbasename}
pkgver=1.22.2
_pkgvermajor=${pkgver%.*}
[[ $_pkgvermajor == *.* ]] || _pkgvermajor=$pkgver
pkgrel=2
pkgdesc='The Kerberos network authentication system (32-bit)'
url='https://web.mit.edu/kerberos/'
arch=('x86_64')
license=('custom')
depends=(
  lib32-e2fsprogs
  lib32-gcc-libs
  lib32-glibc
  lib32-keyutils
  lib32-libldap
  lib32-openssl
  "${_pkgbasename}"
)
makedepends=(
  perl
)
provides=(
  libgssapi_krb5.so
  libgssrpc.so
  libk5crypto.so
  libkadm5clnt_mit.so
  libkadm5srv_mit.so
  libkdb5.so
  libkdb_ldap.so
  libkrad.so
  libkrb5.so
  libkrb5support.so
  libverto.so
)
options=('!emptydirs')
source=(
  https://web.mit.edu/kerberos/dist/krb5/${_pkgvermajor}/${_pkgbasename}-${pkgver}.tar.gz{,.asc}
  https://github.com/krb5/krb5/commit/f5bbfa4821cf590a4748f96d0e016bc0485e95c4.patch
  https://github.com/krb5/krb5/commit/5e4e8452328804948d042235bbf58ca457795857.patch
)
sha512sums=('3237cacfb2019285107991a3211e0d74944c605942ab38a8b4b372703b8f02f5779fa2de80c4e201bd59703d557f37ac346bdc5ea14b986b0a0db23eb422fc6f'
            'SKIP'
            '4323be131122c3d528766b4179d3b49fe98d9f9246a0263d916b7a87c063078544dfc86209fbe83f3675a65187e8cb0733cff23ac1a80795ec5df825da263814'
            '2eba6b1c7e775500d600dec01649cefeef3e36fc200016e2a7228e634394960de5b663be06ec015b4f7e31af916e6d7f3c2a16de3083162660b32d5d3461aae5')
validpgpkeys=('2C732B1C0DBEF678AB3AF606A32F17FD0055C305'  # Tom Yu <tlyu@mit.edu>
              'C4493CB739F4A89F9852CBC20CBA08575F8372DF') # Greg Hudson <ghudson@mit.edu>

prepare() {
   cd ${_pkgbasename}-${pkgver}

  # OpenSSL 4 compatibility
  patch -Np1 -i "${srcdir}/f5bbfa4821cf590a4748f96d0e016bc0485e95c4.patch"
  patch -Np1 -i "${srcdir}/5e4e8452328804948d042235bbf58ca457795857.patch"

  # FS#25384
  sed -i "/KRB5ROOT=/s/\/local//" src/util/ac_check_krb5.m4
}

build() {
   cd "${srcdir}/${_pkgbasename}-${pkgver}/src"

   export CC="gcc -m32"
   export CXX="g++ -m32"
   export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

   export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all"
   export CPPFLAGS+=" -I/usr/include/et"
   export WARN_CFLAGS=""
   ./configure --prefix=/usr \
               --sysconfdir=/etc \
               --localstatedir=/var/lib \
               --libdir=/usr/lib32 \
               --enable-shared \
               --with-system-et \
               --with-system-ss \
               --disable-rpath \
               --without-tcl \
               --enable-dns-for-realm \
               --with-ldap \
               --without-system-verto
   make
}

#check() {
   # We can't do this in the build directory.

   # only works if the hostname is set properly/resolves to something. whatever...
   #cd "${srcdir}/${_pkgbasename}-${pkgver}"
   #make -C src check
#}

package() {
   cd ${_pkgbasename}-${pkgver}/src
   make DESTDIR="${pkgdir}" install

   rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
   install -d "${pkgdir}/usr/share/licenses"
   ln -s ${_pkgbasename} "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
