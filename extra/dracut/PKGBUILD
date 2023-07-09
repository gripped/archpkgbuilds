# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut
pkgver=059
pkgrel=1
pkgdesc="An event driven initramfs infrastructure"
arch=('x86_64')
url="https://github.com/dracutdevs/dracut"
license=('GPL')
depends=('bash' 'coreutils' 'cpio' 'filesystem' 'findutils' 'grep' 'gzip'
         'kmod' 'pkgconf' 'procps-ng' 'sed' 'systemd' 'util-linux' 'xz')
makedepends=('asciidoc' 'bash-completion' 'git')
optdepends=('binutils: --uefi option support'
            'elfutils: strip binaries to reduce initramfs size'
            'multipath-tools: dmraid dracut module support'
            'pigz: faster gzip compression'
            'sbsigntools: uefi_secureboot_cert/key configuration option support')
provides=('initramfs')
backup=('etc/dracut.conf')
source=("${pkgname}-${pkgver}::git+${url}#tag=${pkgver}?signed")
sha512sums=('SKIP')
b2sums=('SKIP')
validpgpkeys=('F66745589DE755B02AD947D71F1139EBBED1ACA9') # Jóhann B. Guðmundsson <johannbg@gmail.com>

# prepare() {
# }

build() {
  local prefix=/usr sysconfdir=/etc
  
  cd "$srcdir/${pkgname}-${pkgver}"

  ./configure \
    --sysconfdir=${sysconfdir} \
    --prefix=${prefix} \
    --libdir=${prefix}/lib \
    --systemdsystemunitdir=${prefix}/lib/systemd/system \
    --bashcompletiondir=$(pkg-config --variable=completionsdir bash-completion)
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  DESTDIR="$pkgdir" make install
}
