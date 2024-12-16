# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=brasero
pkgver=3.12.3+r41+g98342080
pkgrel=1
pkgdesc="CD/DVD mastering tool"
url="https://wiki.gnome.org/Apps/Brasero"
arch=(x86_64)
license=(GPL)
depends=(
  cairo
  cdrtools
  dconf
  dvd+rw-tools
  gdk-pixbuf2
  glib2
  glibc
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  gstreamer
  gtk3
  gvfs
  hicolor-icon-theme
  libcanberra
  libnotify
  libxml2
  pango
  totem-pl-parser
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  gnome-common
  gobject-introspection
  gtk-doc
  intltool
  itstool
  libburn
  libisofs
  libsm
  yelp-tools
)
optdepends=(
  'cdrdao: Alternative backend to copy, burn and blank CDs'
  'dvdauthor: Create disc images suitable for video DVDs'
  'libburn: Alternative backend to burn, blank and format CDs, DVDs and BDs'
  'libdvdcss: Copy CSS encrypted video DVDs to a disc image'
  'libisofs: Alternative backend to create disc images from a file selection'
  'vcdimager: Create disc images suitable for SVCDs'
)
_commit=98342080aa1a05c3543ff45f383681012d4a53c8  # master
source=(
  "git+https://gitlab.gnome.org/GNOME/brasero.git#commit=$_commit"
  brasero-appdata.patch
  brasero-better-error.patch
  brasero-cell-renderer.patch
  brasero-multidrag-treeview.patch
)
b2sums=('d34a48dac687c361415bfc769904261790f21d58a4a778e71034593b04582835642c88dcb8ca64be18aba7a40cb63d4ad27e1ad19eccb089e3eb2519a97951cc'
        '7c197c6c51fe5d8ae3e761badc56152260621b6e666a47af4b0691f51def7bc8b3e8d53a5cf86d5f45f14a3cbabad13604e62bd1f015c560e35ea81ce24aa655'
        'e250c13beafeb62aec9daccd0cb98276d35f3db66244edec3be4cc430b9ccaee40f0b6bfc46e0f418bb9d13c6339c6dfaab6150d3372cdf1855bc98de7dcda9e'
        '9ef20ebe27cfe68452fc6588df1e77875c17de13598b94d41a05c669d926ed87c700fc9da16bb5263923935ec3f27b93187a973045eb8840b2c0ed949582976b'
        'af0a907a788e2ddd682854028a8f66764e2202edf65dee6aa50082d4d97fdc93f43087ca8b354d0c9373c827ce2f55fa9d9db571894f0d151afa24d41a63d50f')

pkgver() {
  cd brasero
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd brasero

  # https://gitlab.gnome.org/GNOME/brasero/-/merge_requests/11
  git apply -3 ../brasero-appdata.patch

  # https://gitlab.gnome.org/GNOME/brasero/-/merge_requests/22
  git apply -3 ../brasero-better-error.patch

  # https://gitlab.gnome.org/GNOME/brasero/-/merge_requests/28
  git apply -3 ../brasero-cell-renderer.patch

  # https://gitlab.gnome.org/GNOME/brasero/-/merge_requests/29
  git apply -3 ../brasero-multidrag-treeview.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd brasero
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-caches \
    --disable-search \
    --disable-schemas-compile \
    --enable-compile-warnings=minimum \
    --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd brasero
  make DESTDIR="$pkgdir" install
}
