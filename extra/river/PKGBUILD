# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river
pkgver=0.5.2
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
)
# optdepends=('polkit: access seat through systemd-logind')
# provides=('river-window-management-v1')
conflicts=('river-classic')

# From build.zig.zon
_zig_deps+=(
  pixman-0.3.0-LClMnz2VAAAs7QSCGwLimV5VUYx0JFnX5xWU6HwtMuDX.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/v0.3.0.tar.gz
  wayland-0.7.0-lQa1kuP8AQD5dW7_o-VKLVD_QbqXe7Zob78r2su7Pyex.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.7.0.tar.gz
  wlroots-0.20.3-jmOlcsh0BACce9rpfvzUI4V3AalGg9GE0QQkvRFoHo1c.tar.gz::https://codeberg.org/ifreund/zig-wlroots/archive/v0.20.3.tar.gz
  xkbcommon-0.5.0-VDqIe8y3AgDU-cGL02xZplwABH3WbpTimrrgbgTgD_3g.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.4.0.tar.gz
)
source=(
    git+https://codeberg.org/river/river.git#tag=v${pkgver}?signed

    # Patch for translate c not finding libraries for included headers
    translate_c_libpath.patch

    "${_zig_deps[@]}"
)
noextract=("${_zig_deps[@]%%::*}")
validpgpkeys=('5FBDF84DD2278DB2B8AD8A5286DED400DDFD7A11') # Isaac Freund <mail@isaacfreund.com>
sha256sums=('18a80d899f6c6d893733dcbdc84a774c275972bce4eabbcb5da7cf078fd777e3'
            'b2f4c707c8692a0821081abd20372d95b06a8be4d6cf93e4021b3492454546d8'
            '4b0b57ce37f7bb3a2c2fc76eec93d060830d2c92155bf2a6baa43d61ad05499e'
            '6eb33184b52f4b8f834c90f539dfb2fc0ec7ce5931896fadb4c3eab720b8c9b8'
            'd87f720c7a979ad45af7a2006f932d22b03c1d48996f67453e4fca7e308be02d'
            'cc1f8835ad6e50d5cd4da82a5d1741203f3d7b47c744418167ba602e75b8b5c7')

prepare() {
  for file in "${_zig_deps[@]%%::*}"; do
    mkdir -p "zig-packages/${file%%.tar.gz}"
    tar -f "$file" -C "zig-packages/${file%%.tar.gz}" -x --strip-components=1
  done

  cd "$pkgname"
  patch -p1 < ../translate_c_libpath.patch
}

build() {
  cd "$pkgname"
  DESTDIR="out" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --system ../zig-packages \
    --build-id=sha1 \
    -Dtarget=native-linux.6.12-gnu.2.42 \
    -Dcpu=baseline \
    -Dpie \
    -Doptimize=ReleaseSafe \
    -Dxwayland
}

check() {
  cd "$pkgname"
  zig build test \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --system ../zig-packages \
    --build-id=sha1 \
    -Dtarget=native-linux.6.12-gnu.2.42 \
    -Dcpu=baseline \
    -Dpie \
    -Doptimize=ReleaseSafe \
    -Dxwayland
}

package() {
  cd "$pkgname"

  cp -a out/* "$pkgdir"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions"

  # add license + exception
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSES/{0BSD.txt,MIT.txt}
}
