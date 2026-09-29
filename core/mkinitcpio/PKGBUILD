# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=42.1
pkgrel=1
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio'
license=('GPL-2.0-only')
depends=('awk' 'mkinitcpio-busybox' 'kmod' 'util-linux' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'gzip' 'filesystem' 'zstd' 'systemd')
checkdepends=('bats' 'bats-assert' 'lzop')
makedepends=('asciidoctor' 'git' 'meson')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS'
            'systemd-ukify: alternative UKI generator')
provides=('initramfs')
backup=('etc/mkinitcpio.conf')
source=("git+$url.git#tag=v${pkgver}?signed")
sha512sums=('d98062aa8bccb439cbf964efc0c75520f7e6be4f67a2a9d0a4aedd815081596100655bebef1c6e823688ec32a6de0e5816c8102912104078b102e63f65417f80')
b2sums=('ac13bea8601226a3f816cefcb8508c04bb58fdc18abffd50db3e4356367f5ed3b305b877d7643c5c95e890526356678b4d53b7fb61092daa22b85757467183d0')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'BB8E6F1B81CF0BB301D74D1CBF425A01E68B38EF')   # nl6720

build(){
	arch-meson -Dsystemd_hooks=true "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
