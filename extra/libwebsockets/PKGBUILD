# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jingbei Li <i@jingbei.li>

pkgname=libwebsockets
pkgver=4.4.2
pkgrel=1
pkgdesc="C library for websocket clients and servers"
arch=(x86_64)
url="https://libwebsockets.org"
license=(MIT)
depends=(glibc openssl libuv libev zlib)
makedepends=(cmake glib2 libcap)
provides=(libwebsockets.so)
source=($pkgname-$pkgver.tar.gz::https://github.com/warmcat/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('4c0800daa822752d0b906f90412ffa83606713852ec83128519d086c47fc615681f368d1cf4737a5bbeb0c8fbceb097d8735c946efd201dee3167ee931e8c000')
b2sums=('0c7ffb0ceebeba2e404ffb6842f6245c6586d78d90ed61c9f997cb5a947f6aeeb0883cd78be22e5131f3e598a8a781a3fc7f71212f1dce537761c6addec89106')

build() {
  # this uses malloc_usable_size, which is incompatible with fortification level 3
  # https://github.com/warmcat/libwebsockets/pull/2977
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=None \
        -D DISABLE_WERROR=ON \
        -D LWS_IPV6=ON \
        -D LWS_LINK_TESTAPPS_DYNAMIC=ON \
        -D LWS_WITH_ACME=ON \
        -D LWS_WITH_DISKCACHE=ON \
        -D LWS_WITH_EXTERNAL_POLL=ON \
        -D LWS_WITH_FTS=ON \
        -D LWS_WITH_GLIB=ON \
        -D LWS_WITH_HTTP2=ON \
        -D LWS_WITH_HTTP_PROXY=ON \
        -D LWS_WITH_LIBEV=ON \
        -D LWS_WITH_LIBEVENT=OFF \
        -D LWS_WITH_LIBUV=ON \
        -D LWS_WITH_LWSAC=ON \
        -D LWS_WITH_RANGES=ON \
        -D LWS_WITH_SOCKS5=ON \
        -D LWS_WITH_STATIC=OFF \
        -D LWS_WITH_THREADPOOL=ON \
        -D LWS_WITH_ZIP_FOPS=ON \
        -D LWS_WITHOUT_BUILTIN_GETIFADDRS=ON \
        -D LWS_WITHOUT_BUILTIN_SHA1=ON \
        -D LWS_WITHOUT_CLIENT=OFF \
        -D LWS_WITHOUT_SERVER=OFF \
        -D LWS_WITHOUT_TESTAPPS=ON \
        -D LWS_WITHOUT_TEST_CLIENT=ON \
        -D LWS_WITHOUT_TEST_PING=ON \
        -D LWS_WITHOUT_TEST_SERVER=OFF \
        -D LWS_WITHOUT_TEST_SERVER_EXTPOLL=ON \
        -D LWS_UNIX_SOCK=ON \
        -Wno-dev \
        -B build \
        -S $pkgname-$pkgver
  make VERBOSE=1 -C build
}

package() {
  depends+=(libcap.so libglib-2.0.so)

  make DESTDIR="$pkgdir" install -C build
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
