# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Contributor: M0Rf30
# Contributor: unifiedlinux
# Contributor: CReimer

pkgname=cinnamon
pkgver=6.6.3
pkgrel=7
pkgdesc='Desktop environment which provides advanced innovative features and a traditional user experience'
arch=(x86_64)
url='https://github.com/linuxmint/cinnamon'
license=(GPL-2.0-or-later)
depends=(
  accountsservice
  at-spi2-core
  bash
  cairo
  cinnamon-control-center
  cinnamon-desktop
  cinnamon-menus
  cinnamon-screensaver
  cinnamon-session
  cinnamon-settings-daemon
  cinnamon-translations
  cjs
  dconf
  evolution-data-server
  gcc-libs
  gcr
  gdk-pixbuf2
  glib2
  glibc
  gnome-backgrounds
  gnome-themes-extra
  gsound
  gstreamer
  gtk3
  hicolor-icon-theme
  libgirepository
  libglvnd
  libibus
  libical
  libkeybinder3
  libnm
  libnotify
  libsecret
  libx11
  libxfixes
  libxml2
  muffin
  nemo
  network-manager-applet
  pango
  papirus-icon-theme
  polkit
  python
  python-cairo
  python-gobject
  python-pam
  python-pexpect
  python-pillow
  python-psutil
  python-pyinotify
  python-pytz
  python-requests
  python-setproctitle
  python-tinycss2
  python-xapp
  sound-theme-freedesktop
  timezonemap
  upower
  xapp
  xdg-desktop-portal-xapp
)
optdepends=(
  'blueman: Bluetooth support'
  'gnome-keyring: Secrets service backend'
  'ibus: input method support'
  'switcheroo-control: GPU offloading'
  'system-config-printer: printer settings'
  'touchegg: touch gestures'
  'wget: cover download support in audio applet'
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-libsass
)
source=(
  "git+https://github.com/linuxmint/cinnamon.git#tag=$pkgver"
  cinnamon-menu-button.patch
  cinnamon-set-wheel.patch
  30_org.archlinux.cinnamon.gschema.override
)
b2sums=(
  bf9c79f6347f7e4a7a6bccf09be777c3edc057500539bba8a6deb0af91a4f8e292d47a549d5dfe995bb666f1e361f15c55fbd072906e4374d37007c76423defa
  716095bf9b74fad22714040dfd3d7b115eb950a81b4ec809f8541d81102bc276532948d1e70c2d022b061cc8e939276b9f51f4fedb01c6ef2940d1232253460d
  3becf1f40068fc629109e6e7d464c3c484296afacc9ab6328b2ccbb3c9735bcbfa9550f9f73b430ede178ae668e37c660ce322b5b4d1873526de3d3d41185160
  c071ce664c5189883c409d65b1d054ef4526c0283484e936b10500cec13efdaf3e3792459e648817e1c48e0505bc1154950ce3080cd9aafe0f5de8da5b16bafd
)

prepare() {
  cd $pkgname

  # Hide icon themes that marked as 'Hidden'
  # https://github.com/linuxmint/cinnamon/pull/13307
  git cherry-pick -n 7a297049113bccc99c9457d818ed59814c479803

  # Add Traditional button layout option
  # https://github.com/linuxmint/cinnamon/pull/13326
  git apply -3 ../cinnamon-menu-button.patch

  # Use wheel group instread of sudo (taken from Fedora)
  patch -Np1 -i ../cinnamon-set-wheel.patch

  # Cinnamon has no upstream backgrounds, use GNOME backgrounds instead
  # https://github.com/linuxmint/cinnamon/issues/3575#issuecomment-374887122
  sed -i 's|/usr/share/cinnamon-background-properties|/usr/share/gnome-background-properties|' \
    files/usr/share/cinnamon/cinnamon-settings/modules/cs_backgrounds.py

  # Don't hide any valid themes from the list
  sed -i '/if .* in THEMES_BLACKLIST:/,+1 d' files/usr/share/cinnamon/cinnamon-settings/modules/cs_themes.py
}

build() {
  arch-meson $pkgname build \
    --libexecdir=lib/$pkgname \
    -D docs=true
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
  install -Dm644 -t "$pkgdir/usr/share/glib-2.0/schemas" 30_org.archlinux.cinnamon.gschema.override
}
