# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=libgit2
# NOTE: add the following packages to rebuild TODOs on soname change (although they do not link against libgit2.so):
# julia
pkgver=1.9.3
pkgrel=1
epoch=1
pkgdesc="A linkable library for Git"
arch=(x86_64)
url="https://github.com/libgit2/libgit2"
license=(LicenseRef-GPL-2.0-only-with-linking-exception)
depends=(
  libgcc
  glibc
  llhttp
  zlib
)
makedepends=(
  cmake
  libssh2
  openssl
  pcre2
  python
)
provides=(libgit2.so)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('5359d07b85b691b92784d5ef52825be2c1f1616bab8e969e51177bf8f5e767edbaf267943296407f62df1f3d7fa08e48c802374289046b71da2cc1ac7d43a15f')
b2sums=('9f968cede042cc494c53c12f36ebee64a25637a40570373bd46c0c278436851a7a62c433e62d977919892ff4035fea5fef0d6468074cdff960ec6b4d3d160f83')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D REGEX_BACKEND=pcre2
    -D USE_HTTP_PARSER=llhttp
    -D USE_SSH=ON
    -S $pkgname-$pkgver
    -W no-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  local ignored_tests=(
    'auth_clone|'
    'invasive|'
    'online|'
    'network_url_parse__hostname_implied_root_empty_port|'
    'network_url_parse__hostname_empty_port|'
    'network_url_parse__ipv4_implied_root_empty_port|'
    'network_url_parse__ipv4_empty_port|'
    'network_url_parse__ipv6_implied_root_empty_port|'
    'network_url_parse__ipv6_empty_port|'
    'proxy|'
    'proxy_auto_not_detected|'
    'ssh'
  )
  local ifs="$IFS"
  IFS=
  # NOTE: disable tests requiring the internet, relying on non-existent
  # resources, or those that are only compatible with the (modified) vendored
  # version of http-parser, but not with upstream http-parser
  ctest --test-dir build --output-on-failure -E "${ignored_tests[*]}"
  IFS="$ifs"
}

package() {
  depends+=(
    libssh2 libssh2.so
    openssl libcrypto.so libssl.so
    pcre2 libpcre2-8.so
  )

  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
