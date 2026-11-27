# Maintainer: Daurnimator <daurnimator@archlinux.org>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river-classic
pkgver=0.3.18
pkgrel=1
pkgdesc="A dynamic tiling wayland compositor"
arch=('x86_64')
url="https://codeberg.org/river/river-classic"
license=('GPL-3.0-or-later')
depends=('glibc'
         'libevdev'
         'libinput'
         'libxkbcommon'
         'mesa'
         'pixman'
         'sh'
         'wayland'
         'wlroots0.20'
         'xorg-xwayland')
makedepends=('git'
             'scdoc'
             'wayland-protocols'
             'zig')
optdepends=('polkit: access seat through systemd-logind')
provides=('wayland-compositor')
conflicts=('river')

# From build.zig.zon
_zig_deps+=(
  pixman-0.3.0-LClMnz2VAAAs7QSCGwLimV5VUYx0JFnX5xWU6HwtMuDX.tar.gz::https://codeberg.org/ifreund/zig-pixman/archive/v0.3.0.tar.gz
  wayland-0.7.0-lQa1kuP8AQD5dW7_o-VKLVD_QbqXe7Zob78r2su7Pyex.tar.gz::https://codeberg.org/ifreund/zig-wayland/archive/v0.7.0.tar.gz
  wlroots-0.20.3-jmOlcsh0BACce9rpfvzUI4V3AalGg9GE0QQkvRFoHo1c.tar.gz::https://codeberg.org/ifreund/zig-wlroots/archive/v0.20.3.tar.gz
  xkbcommon-0.5.0-VDqIe8y3AgDU-cGL02xZplwABH3WbpTimrrgbgTgD_3g.tar.gz::https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.4.0.tar.gz
  # translate_c-2.0.2-Q_BUWvBNBwDnyehSiuAJmdFcMYHYGA-Jc3KiYdrV2Dqx.tar.gz::https://codeberg.org/ziglang/translate-c?ref=zig-0.17.x#cfac21f3199b2b02ce3fd7db652aa456421fe4ab
)

source=(git+https://codeberg.org/river/river-classic.git#tag=v${pkgver}?signed

    # Patch for translate c not finding libraries for included headers
    libinput-include.patch

    "${_zig_deps[@]}"

)
noextract=("${_zig_deps[@]}")
validpgpkeys=('5FBDF84DD2278DB2B8AD8A5286DED400DDFD7A11') # Isaac Freund <mail@isaacfreund.com>
sha256sums=('293277d712c7e29fa937123e8d1c471125254d1d6a6fa0d7f1a067e707dce9f0'
            'fd61e0aef9f45c489d94022bd64f23b2b519a23b0b5c6c5740241b0789d93462'
            '4b0b57ce37f7bb3a2c2fc76eec93d060830d2c92155bf2a6baa43d61ad05499e'
            '6eb33184b52f4b8f834c90f539dfb2fc0ec7ce5931896fadb4c3eab720b8c9b8'
            'd87f720c7a979ad45af7a2006f932d22b03c1d48996f67453e4fca7e308be02d'
            'cc1f8835ad6e50d5cd4da82a5d1741203f3d7b47c744418167ba602e75b8b5c7'
            # 'efe8d937528107a983220b87237a2ca0d81214d9ff20e6e4e2d81ef8a6fd58d4'
)
              
prepare() {
  for file in "${_zig_deps[@]%%::*}"; do
    mkdir -p "zig-packages/${file%%.tar.gz}"
    tar -f "$file" -C "zig-packages/${file%%.tar.gz}" -x --strip-components=1
  done

  cd "$pkgname"
  patch -Np1 -i ../libinput-include.patch
}

build() {
  cd $pkgname
  
  DESTDIR="out" zig build \
    -Dllvm --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    -Dtarget=native-linux.6.12-gnu.2.42 \
    -Dcpu=baseline \
    -Dpie \
    -Doptimize=ReleaseSafe \
    -Dxwayland
}

check() {
  cd $pkgname
  zig build test \
    -Dllvm --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --build-id=sha1 \
    -Dtarget=native-linux.6.12-gnu.2.42 \
    -Dcpu=baseline \
    -Dpie \
    -Doptimize=ReleaseSafe \
    -Dxwayland
}

package() {
  cd $pkgname

  cp -a out/* "$pkgdir"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 contrib/river.desktop -t "$pkgdir/usr/share/wayland-sessions"

  install -d "$pkgdir/usr/share/$pkgname"
  cp -a example "$pkgdir/usr/share/$pkgname"
}
