# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Remi Gacogne <rgacogne@archlinux.org>

pkgname=getdns
pkgver=1.7.3
pkgrel=3
pkgdesc="Modern asynchronous DNS API"
arch=(x86_64)
url="https://getdnsapi.net"
license=(BSD)
depends=(libbsd libev libevent libidn2 libuv libyaml unbound check)
makedepends=(cmake)
source=("${url}/dist/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "getdns-openssl-4.patch::https://github.com/getdnsapi/getdns/commit/735764d84272cb46f8fd4c3ddfe0cacbda0d9323.patch")
sha256sums=(f1404ca250f02e37a118aa00cf0ec2cbe11896e060c6d369c6761baea7d55a2c
            SKIP
            6979d9a925c6f14324a18ce24c383878cc7ff74d1120c5f7c3fa35c9cb0daa96)
validpgpkeys=(DC34EE5DB2417BCC151E5100E5F8F8212F77A498) # Willem Toorop <willem@nlnetlabs.nl>

prepare() {
  cd ${pkgname}-${pkgver}
  # Use accessors for opaque ASN.1 structures in OpenSSL 4.
  patch -Np1 -i "$srcdir/getdns-openssl-4.patch"
}

build() {
  cmake -B build -S ${pkgname}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_STATIC=OFF \
    -DCURRENT_DATE=$(date -u --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" "+%Y-%m-%dT%H:%M:%SZ") \
    -DPATH_TRUST_ANCHOR_FILE=/etc/trusted-key.key
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${pkgname}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
