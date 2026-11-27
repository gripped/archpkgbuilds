# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=libxslt
pkgname=(
  libxslt
  libxslt-docs
)
pkgver=1.1.45
pkgrel=3
pkgdesc="XML stylesheet transformation library"
url="https://gitlab.gnome.org/GNOME/libxslt/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(
  bash
  glibc
  libxml2
)
makedepends=(
  git
  python
)
checkdepends=(
  docbook-xml
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libxslt.git#tag=v$pkgver"
  0001-runtest-Print-output-causing-failure.patch
  0002-Verify-dictionary-ownership-before-aliasing-attribut.patch
  0003-Fix-type-confusion-in-xsltParseTemplateContent.patch
  0004-Fix-use-after-free-in-direct-pattern-match-cache.patch
)
b2sums=('5370da9c8febd177b3a19e7b2e443674277b5b8e6c88a7563b789fba1c1dbc1ddcfaab5732d42cd8145a57665ee00968e8a3a7e704b4d2f9dcd6eab0791480b3'
        '23c696c4201d0227c71ec12fc19ed23e5997d235b5d001a52e41a3cc2da0f4ddf62f54652927fde460ccda82eaff23a4f23b2cece491c5b58cfd78ee3d93ce3f'
        '8b1cd9dcc36683d919de06af9dec3e2ae3ea8980c626c6b76b371674e8526699379bf40458457fed933bd35448fecbfde93d28163fd12404cad2cb55573d73be'
        'c723e3ba524904218fb15bea04018cff3bbd6ad486211a1b06121bf50340f7ad6c725ddff2df6ac78474e7d8ead4e52f5dfb8c815388d1ab8f9d059499f86f0a'
        '0a8a795723b032771df6317d7a94371352fbcac96d73ea798257854f0177e5fd2607685060a16dd354a64cee10b5d50fc21d8b52d31514d714e22f4aa0c9fbf5')

prepare() {
  cd libxslt

  # Make test failures easier to fix
  git apply -3 ../0001-runtest-Print-output-causing-failure.patch

  # Fix CVE-2026-9947
  # https://chromium-review.googlesource.com/c/chromium/src/+/7778588
  git apply -3 ../0002-Verify-dictionary-ownership-before-aliasing-attribut.patch

  # Fix CVE-2026-11196
  # https://chromium-review.googlesource.com/c/chromium/src/+/7779759
  git apply -3 ../0003-Fix-type-confusion-in-xsltParseTemplateContent.patch

  # Fix CVE-2026-125350
  # https://chromium-review.googlesource.com/c/chromium/src/+/8762073
  git apply -3 ../0004-Fix-use-after-free-in-direct-pattern-match-cache.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
    --with-python=/usr/bin/python
  )

  cd libxslt
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libxslt
  make check
}

package_libxslt() {
  optdepends=('python: Python bindings')
  provides=(lib{,e}xslt.so)

  cd libxslt
  make DESTDIR="$pkgdir" install

  mkdir -p ../doc/usr/share
  mv "$pkgdir"/usr/share/{doc,gtk-doc} -t ../doc/usr/share

  install -Dm644 Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libxslt-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"

  install -Dm644 libxslt/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
