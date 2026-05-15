# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river
pkgver=0.4.5
pkgrel=1
pkgdesc='a non-monolithic Wayland compositor'
arch=('x86_64')
url="https://isaacfreund.com/software/river/"
license=('0BSD' 'CC-BY-SA-4.0' 'GPL-3.0-only' 'MIT')
depends=(
    'glibc'
    'libevdev'
    'libinput'
    'libxkbcommon'
    # 'mesa'
    'pixman'
    # 'sh'
    'wayland'
    'wlroots0.20'
    'xorg-xwayland'
)
makedepends=(
    'git'
    'scdoc'
    'wayland-protocols'
    'zig'
    # https://codeberg.org/ziglang/zig/issues/31272
    'clang'
)
# optdepends=('polkit: access seat through systemd-logind')
# provides=('river-window-management-v1')

source=(git+https://codeberg.org/river/river.git#tag=v${pkgver}?signed)
#
# disable source caching for now: https://codeberg.org/ziglang/zig/issues/31866
# 
# PACKAGING.md -> build.zig.zon
# source+=(zig-pixman-0.3.0.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/v0.3.0.tar.gz
         # zig-wayland-0.6.0.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.6.0.tar.gz
         # zig-wlroots-0.20.1.tar.gz::https://codeberg.org/ifreund/zig-wlroots/archive/v0.20.1.tar.gz
         # zig-xkbcommon-0.4.0.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.4.0.tar.gz
         # translate_c::git+https://codeberg.org/ziglang/translate-c.git#commit=57c559cf581b1fcad90494eda219f98abeb155ce)
noextract=("${source[@]:1}")
conflicts=('river-classic')
validpgpkeys=('5FBDF84DD2278DB2B8AD8A5286DED400DDFD7A11') # Isaac Freund <mail@isaacfreund.com>
sha256sums=('87b6d9ca61be97e1493c539887ae18c5bd9a9b0bbf13ada0458e0b4f3ce0b93b'
            # 'cd7fe3415d4d58685a94fdedd308e9994a37f012828940cfb603461de7f2c6ad'
            # 'fa9705e83613b5555d7117ce5c602f10591d6598e69a73fba2e6039200db4f4b'
            # '75af3510386c639582693d01788579abde4dca9ce1ae6703c1e877ec8123d106'
            # 'e6df77d511cf9402f6ac08455c8d1fb727b6c3d66191e246671f62e5db083c49')
)

# prepare() {
#     zig fetch --global-cache-dir ./zig-global-cache "./${source[1]%%::*}"
#     zig fetch --global-cache-dir ./zig-global-cache "./${source[2]%%::*}"
#     zig fetch --global-cache-dir ./zig-global-cache "./${source[3]%%::*}"
#     zig fetch --global-cache-dir ./zig-global-cache "./${source[4]%%::*}"
# }

build() {
  cd $pkgname
  DESTDIR="build" zig build \
    -Dllvm --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Dpie \
    -Doptimize=ReleaseSafe \
    -Dxwayland
    # --global-cache-dir ../zig-global-cache \
    # --system ../zig-global-cache/p \
}

check() {
  cd $pkgname
  zig build test \
    -Dllvm --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    -Dtarget=native-linux.6.6-gnu.2.40 \
    -Dcpu=baseline \
    -Dpie \
    -Doptimize=ReleaseSafe \
    -Dxwayland
    # --global-cache-dir ../zig-global-cache \
    # --system ../zig-global-cache/p \
}

package() {
  cd $pkgname

  cp -a build/* "$pkgdir"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions"

  # add license + exception
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSES/{0BSD.txt,MIT.txt}
}
