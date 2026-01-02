# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Filipe Laíns <lains@archlinux.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Florian Pritz <bluewind at jabber dot ccc dot de>
# Contributor: Peter Wu <peter@lekensteyn.nl>

pkgbase=wireshark
pkgname=(wireshark-cli wireshark-qt)
pkgver=4.6.2
pkgrel=2
pkgdesc='Network traffic and protocol analyzer/sniffer'
url='https://www.wireshark.org/'
arch=(x86_64)
license=(GPL-2.0-only)
makedepends=(
  asciidoctor
  bcg729
  brotli
  c-ares
  cmake
  desktop-file-utils
  doxygen
  gcc-libs
  git
  glib2
  glibc
  gnutls
  hicolor-icon-theme
  krb5
  libcap
  libgcrypt
  libmaxminddb
  libnghttp2
  libnghttp3
  libnl
  libnl
  libpcap
  libssh
  libxml2
  libxslt
  lua
  lz4
  minizip
  ninja
  opus
  pcre2
  python
  qt6-5compat
  qt6-base
  qt6-multimedia
  qt6-svg
  qt6-tools
  sbc
  snappy
  spandsp
  speexdsp
  systemd-libs
  xxhash
  zlib-ng
  zstd
)
checkdepends=(
  python-pytest
  python-pytest-xdist
)
options=('!emptydirs')
source=(
  "git+https://gitlab.com/wireshark/wireshark.git#tag=v${pkgver}"
  wireshark.sysusers
)
sha512sums=('ad135790a5a380a68ecdc51690ef6b36ac13e339ff4b48b4abf9be4ff6503350f6889baf7e9cafba86c27d0d83af95d52ec99db6de829de4bb4ca823f2bb2b5d'
            '3956c1226e64f0ce4df463f80b55b15eed06ecd9b8703b3e8309d4236a6e1ca84e43007336f3987bc862d8a5e7cfcaaf6653125d2a34999a0f1357c52e7c4990')
b2sums=('c4ae77c8298b381e2b97a92bf096a1e8e2f6b9a013f3d75b58e5680494eff869bb7acd83aeda81a6a7ed350f2347abbf5abead6e3bc40ab39c079a492c522f6a'
        '3cebcc993f51eaf0e09673c77e0436598593ef5eff306d880415ccc8eecb32fee93c9a6986f1a7bb0835ab7f9732369d7c5a07e6c053d6293e73a1ea84c58a5c')

build() {
  cd ${pkgbase}
  cmake \
    -B build \
    -G Ninja \
    -DVCSVERSION_OVERRIDE="Git v${pkgver} packaged as ${pkgver}-${pkgrel}" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_SKIP_INSTALL_RPATH=TRUE \
    -DENABLE_LUA=ON \
    -DENABLE_ZLIB=OFF \
    -Wno-dev
  ninja -C build -v
}

check() {
  cd ${pkgbase}
  ninja -C build -v test
}

package_wireshark-cli() {
  pkgdesc+=' - CLI tools and data files'
  depends=(
    bcg729
    brotli
    c-ares
    gcc-libs
    glib2
    glibc
    gnutls
    krb5
    libbrotlidec.so
    libcap
    libcap.so
    libcares.so
    libgcrypt
    libk5crypto.so
    libkrb5.so
    libmaxminddb
    libnghttp2
    libnghttp3
    libnl
    libpcap
    libpcap.so
    libssh
    libxml2
    lua
    lz4
    opencore-amr
    opus
    pcre2
    sbc
    snappy
    spandsp
    speexdsp
    systemd-libs
    xxhash
    zlib-ng
    zstd
  )
  install=wireshark.install
  conflicts=(wireshark)
  provides=(libwireshark.so libwiretap.so libwsutil.so)

  cd ${pkgbase}
  DESTDIR="${pkgdir}" ninja -C build install
  DESTDIR="${pkgdir}" cmake --install build --component Development

  # wireshark uid group is 150
  install -Dm 644 "${srcdir}"/wireshark.sysusers "${pkgdir}"/usr/lib/sysusers.d/wireshark.conf
  chgrp 150 "${pkgdir}"/usr/bin/dumpcap
  chmod 754 "${pkgdir}"/usr/bin/dumpcap

  cd "${pkgdir}"
  rm -r usr/share/mime \
    usr/share/icons \
    usr/share/man/man1/wireshark.1 \
    usr/bin/wireshark \
    usr/share/applications/org.wireshark.Wireshark.desktop \
    usr/share/metainfo/org.wireshark.Wireshark.metainfo.xml \
    usr/share/doc/wireshark/wireshark.html
}

package_wireshark-qt() {
  pkgdesc+=' - Qt GUI'
  depends=(
    desktop-file-utils
    gcc-libs
    glib2
    glibc
    hicolor-icon-theme
    libgcrypt
    libnl
    libpcap
    libpcap.so
    libwireshark.so
    libwiretap.so
    libwsutil.so
    minizip
    qt6-5compat
    qt6-base
    qt6-multimedia
    qt6-svg
    shared-mime-info
    speexdsp
    wireshark-cli
    xdg-utils
  )
  replaces=(wireshark wireshark-gtk wireshark-common)
  conflicts=(wireshark wireshark-gtk wireshark-common)

  cd ${pkgbase}
  install -d "${srcdir}/staging"
  DESTDIR="${srcdir}/staging" ninja -C build install

  cd "${srcdir}"/staging
  install -Dm 755 usr/bin/wireshark -t "${pkgdir}"/usr/bin
  install -Dm 644 usr/share/man/man1/wireshark.1 -t "${pkgdir}"/usr/share/man/man1
  install -Dm 644 usr/share/doc/wireshark/wireshark.html -t "${pkgdir}"/usr/share/doc/wireshark

  cd "${srcdir}"/staging/usr/share
  install -Dm 644 applications/org.wireshark.Wireshark.desktop -t "${pkgdir}"/usr/share/applications
  install -Dm 644 mime/packages/org.wireshark.Wireshark.xml -t "${pkgdir}"/usr/share/mime/packages
  install -Dm 644 metainfo/org.wireshark.Wireshark.metainfo.xml -t "${pkgdir}"/usr/share/metainfo
  mv icons "${pkgdir}"/usr/share/icons
}

# vim: ts=2 sw=2 et:
