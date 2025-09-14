# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk>

# This must be built against the version of dovecot being used,
# else mail delivery will fail.
# Specify the version of dovecot to be used here:
_dcpkgver=2.4.1
# Make sure to bump pkgrel if changing this.

_dcmajor="$(awk -F'.' '{printf "%d.%d", $1, $2}' <<< "${_dcpkgver}")"

pkgname=pigeonhole
pkgver=2.4.1
pkgrel=1

pkgdesc='Sieve implementation for Dovecot'
url='https://pigeonhole.dovecot.org/'
arch=('x86_64')
license=('LGPL-2.1-only')

depends=("dovecot=${_dcpkgver}")

conflicts=('dovecot-sieve' 'pigeonhole-hg')

# NOTE: Why is there a -4 after pkgver? It's not documented upstream at all.
_unknown_version_string='-4'
source=("https://pigeonhole.dovecot.org/releases/${_dcmajor}/dovecot-pigeonhole-${pkgver}${_unknown_version_string}.tar.gz"{,.sig})

sha256sums=('b016b79503543f1d6047e7bc93ef6d2fb5bfc3d697cab1418c5dc488b1974e0e'
            'SKIP')
validpgpkeys=(
  '42F3CD50D4F25A41833BEE3704D62B1E3DFBB4F4' # Stephan Bosch <stephan@rename-it.nl>
  '2BE74AAB3EE754DFB9C80D3318A348AEED409DA1'
  'EF0882079FD4ED32BF8B23B2A1B09EF84EDC5219'
)


prepare() {
  cd "dovecot-pigeonhole-${pkgver}${_unknown_version_string}"

  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      patch -p1 -N -l -i "$srcdir/${filename##*/}"
    fi
  done
}

build() {
  cd "dovecot-pigeonhole-${pkgver}${_unknown_version_string}"

  ./configure \
    --prefix=/usr \
    --with-dovecot=/usr/lib/dovecot \
    --with-moduledir=/usr/lib/dovecot/modules \
    --disable-static
  make
}

check() {
  cd "dovecot-pigeonhole-${pkgver}${_unknown_version_string}"
  make check
}

package() {
  cd "dovecot-pigeonhole-${pkgver}${_unknown_version_string}"

  make DESTDIR="$pkgdir" install
}
