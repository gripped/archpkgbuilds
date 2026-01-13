# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-lts-krypton
pkgver=24.13.0
pkgrel=1
pkgdesc='Evented I/O for V8 javascript ("Active LTS" release: Krypton)'
arch=('x86_64')
url='https://nodejs.org/'
license=('MIT')
depends=(
#  'ada'
  'brotli'
  'c-ares'
  'icu'
  'libnghttp2'
  'libnghttp3'
  'libngtcp2'
  'libuv'
#  'llhttp'
  'openssl'
  'simdjson'
#  'simdutf'
#  'v8'
  'zlib'
)
makedepends=(
  'git'
  'procps-ng'
  'python'
)
optdepends=('npm: nodejs package manager')
provides=(
  "nodejs=$pkgver"
  nodejs-lts
)
conflicts=(nodejs)
options=('!lto')
source=("git+https://github.com/nodejs/node.git#tag=v$pkgver?signed")
b2sums=('ec771721f9aab7ee0e5ba4731bea1a75c8b1d039d9f8d50b69e86c27082fa5b28cac9802bdf22c4d0ad2ad59576cbe35081a042975fbe2f286e5e3c1232e9958')
validpgpkeys=(
  '8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600' # Michaël Zasso (Targos) <targos@protonmail.com>
  '890C08DB8579162FEE0DF9DB8BEAB4DFCF555EF4' # RafaelGSS <rafael.nunu@hotmail.com>
  'C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C' # Richard Lau <rlau@redhat.com>
  'C0D6248439F1D5604AAFFB4021D900FFDB233756' # Antoine du Hamel <duhamelantoine1995@gmail.com>
  '5BE8A3F6C8A5C01D106C0AD820B1A390B168D356' # Antoine du Hamel <antoine.duhamel@rosa.be>
  'CC68F5A3106FF448322E48ED27F5E38D5B0A215F' # marco-ippolito <marcoippolito54@gmail.com>
)

_set_flags() {
  # /usr/lib/libnode.so uses malloc_usable_size, which is incompatible with fortification level 3
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
}

prepare() {
  cd node
  # Update ICU test data
  git cherry-pick --no-commit 5afe4cd716cbf7699f6abc99338f44db3b1424d5
}

build() {
  _set_flags
  cd node

  ./configure \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-corepack \
    --without-npm \
    --shared-brotli \
    --shared-cares \
    --shared-libuv \
    --shared-nghttp2 \
    --shared-nghttp3 \
    --shared-ngtcp2 \
    --shared-openssl \
    --shared-simdjson \
    --shared-zlib
    # --shared-ada
    # --shared-http-parser
    # --shared-simdutf
    # --shared-v8

  make
}

check() {
  _set_flags
  cd node
  rm test/parallel/test-http2-client-set-priority.js
  rm test/parallel/test-http2-client-unescaped-path.js
  rm test/parallel/test-http2-max-invalid-frames.js
  rm test/parallel/test-http2-misbehaving-flow-control.js
  rm test/parallel/test-http2-misbehaving-flow-control-paused.js
  rm test/parallel/test-http2-multi-content-length.js
  rm test/parallel/test-http2-priority-event.js
  rm test/parallel/test-http2-reset-flood.js
  rm test/parallel/test-tls-ocsp-callback.js


  # https://github.com/nodejs/node/pull/60523
  rm test/parallel/test-datetime-change-notify.js

  make test-only
}

package() {
  _set_flags
  cd node
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
