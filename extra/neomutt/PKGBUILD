# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Alad Wenter <alad@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Chris Salzberg <chris@dejimata.com>
# Contributor: Leonidas Spyropoulos <artafinde@gmail.com>
pkgname=neomutt
pkgver=20260105
pkgrel=1
epoch=1
pkgdesc='A version of mutt with added features'
url='https://neomutt.org/'
license=('GPL-2.0-only')
arch=('x86_64')
depends=(
    'gdbm'
    'glibc'
    'gnutls'
    'gpgme'
    'krb5'
    'kyotocabinet'
    'libidn2'
    'libsasl'
    'lmdb'
    'lua'
    'lz4'
    'ncurses'
    'notmuch-runtime'
    'sqlite'
    'zlib'
    'zstd'
)
optdepends=(
    'ca-certificates: default CA certificates'
    'perl: smime_keys'
    'python: keybase.py'
)
makedepends=(
    'docbook-xsl'
    'git'
    'gnupg'
    'libxslt'
    'w3m'
)
source=(
    "git+https://github.com/neomutt/neomutt.git#tag=${pkgver}"
    "default-ca-certificates.patch"
)
sha256sums=('882e51f531c223e7d20435e57719b67a7db478f9dc7fc57a96c0c7deeb37eef1'
            '571716b8979e9b43328416c3c56eff228b6c58355d7c080b8987ea89c6360776')
validpgpkeys=('86C2397270DD7A561263CA4E5FAF0A6EE7371805') # Richard Russon (flatcap) <rich@flatcap.org>

prepare() {
    cd "$pkgname"
    patch -Np1 -i ../default-ca-certificates.patch
}

build() {
    cd "$pkgname"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --gpgme \
        --sqlite \
        --autocrypt \
        --lua \
        --notmuch \
        --gss \
        --gnutls \
        --sasl \
        --with-ui=ncurses \
        --with-idn2=/usr \
        --disable-idn \
        --idn2 \
        --lmdb \
        --kyotocabinet \
        --gdbm \
        --ubsan \
        --lz4 \
        --zlib \
        --zstd
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
