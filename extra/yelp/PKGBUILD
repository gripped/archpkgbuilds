# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=yelp
pkgver=42.2
pkgrel=3
pkgdesc="Get help with GNOME"
url="https://apps.gnome.org/Yelp"
license=(GPL-2.0-or-later)
arch=(x86_64)
depends=(
  bzip2
  dconf
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libhandy
  libxml2
  libxslt
  sqlite
  webkit2gtk-4.1
  xz
  yelp-xsl
)
makedepends=(
  appstream-glib
  autoconf-archive
  git
  glib2-devel
  itstool
)
optdepends=('man-db: View manual pages')
provides=(libyelp.so)
groups=(gnome)
source=(
  "git+https://gitlab.gnome.org/GNOME/yelp.git#tag=$pkgver"
  0001-Remove-gtk-doc.patch
  0002-CVE-2025-3155.patch
)
b2sums=('16a45eedd3444a9817298ffd63ba0f4ed286b1a21c54bfd51fcab6e253d73b7fbf59e82e833c82e45d7a4189bea97ba7b186844073e2b9d225207aa2faeda6f6'
        '5b530dcd424619ca17ff45f5e2ec6140fe998251c0f6bc96aebb22f2b89a076b7f2a38ff9d13cd1512e4c687d5797cead23b65324b083aabda2b4e93a2afa4cf'
        'e36ea4c361d8968a47343a1b6455f0c036628afeca1e63edbe70337ae8867b82eadca4cf2639e5c09a72f2e5dfe519718baeb251a17b8ddf36f4d1c668c25720')

prepare() {
  cd yelp

  # Remove vestiges of docs build to allow building without gtk-doc
  git apply -3 ../0001-Remove-gtk-doc.patch

  # https://blogs.gnome.org/mcatanzaro/2025/04/15/dangerous-arbitrary-file-read-vulnerability-in-yelp-cve-2025-3155/
  git apply -3 ../0002-CVE-2025-3155.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --enable-compile-warnings=minimum
    --disable-static
  )

  cd yelp
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd yelp
  make DESTDIR="$pkgdir" install
}

# vim:set sw=2 sts=-1 et:
