# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: Thomas Scholtes <geigerzaehler@axiom.fm>

pkgname=radicle-desktop
pkgver=0.16.0
pkgrel=1
pkgdesc='Radicle desktop app'
url='https://radicle.network/desktop'
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
  'cairo' 'libcairo.so'
  'dbus' 'libdbus-1.so'
  'gdk-pixbuf2' 'libgdk_pixbuf-2.0.so'
  'glib2' 'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
  'glibc'
  'gtk3' 'libgdk-3.so' 'libgtk-3.so'
  'hicolor-icon-theme'
  'libgcc' 'libgcc_s.so'
  'libsoup3' 'libsoup-3.0.so'
  'radicle'
  'webkit2gtk-4.1' 'libjavascriptcoregtk-4.1.so' 'libwebkit2gtk-4.1.so'
  'zlib' 'libz.so'
)
makedepends=(
  'cargo'
  'cargo-tauri'
  'git'
  'npm'
  'pango'
)
source=(
  "radicle-desktop::git+https://seed.radicle.dev/z4D5UCArafTzTQpDZNQRuqswh3ury.git#tag=releases/${pkgver}"
)
sha256sums=('4473faa7799c8305c8449e398e63b26e56d7a7247358f1708f6ed6dc0c75d2db')
b2sums=('06f0d862a1f231a3f7d97b38119c43cf03669d5d5578ea1987d35d0686c4ff4061497e2558f1e7a2d502208541c85d4c5c051a1b446c87076e3a528bd6581521')

prepare() {
  cd "${pkgname}"
  cargo fetch --locked --target host-tuple
  npm ci
}

build() {
  cd "${pkgname}"
  export CFLAGS+=" -ffat-lto-objects"
  cargo tauri build -b deb --ci
}

package() {
  mv -v "${pkgname}"/target/release/bundle/deb/radicle-desktop_*/data/usr "${pkgdir}"
}

# vim: ts=2 sw=2 et:
