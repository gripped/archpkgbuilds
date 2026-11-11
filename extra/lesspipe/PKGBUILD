# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=lesspipe
pkgver=2.29
pkgrel=1
pkgdesc='an input filter for the pager less'
depends=('less')
makedepends=('zsh')
arch=('any')
license=('GPL-2.0-or-later')
optdepends=('rpmextract: support for rpm files'
	    'fastjar: support for jar files'
	    'unzip: support for zip files'
	    'unrar: support for rar files'
	    'p7zip: support for 7za files'
	    'cabextract: support for cab files'
	    'cdrtools: support for iso files'
	    'html2text: support for html files'
	    'ghostscript: support for ps files'
	    'djvulibre: support for DjVu files'
	    'odt2txt: support for OpenDocument files'
	    'antiword: support for word file'
	    'catdoc: support for word file'
	    'pandoc: support for word file'
	    'libreoffice-fresh: support for MS Office files'
	    'unrtf: support for rtf file'
	    'mediainfo: support for mp4 file'
	    'imagemagick: support for some image file'
            'tailspin: support for colorizing log files')
url="https://www-zeuthen.desy.de/~friebel/unix/lesspipe.html"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wofr06/lesspipe/archive/refs/tags/v${pkgver}.tar.gz"
        'lesspipe.sh')
b2sums=('2b8f4c140fc7ed4f2b61c947688221f62cbcfb5202650f3262cbe51a0340dc49ac60f573e897d36715251be3c2c0ca4279055f2c981cc4718e7a58ae22c9e9fb'
        'bf7dfbd8e00257995e1be518e1c46619139635e33dd4f6fbb89340b6a94494f076095efd6351829d390eaf0ed6e119dbc3fba3a7bc39d8e83f093c458df792b2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --bash-completion-dir=/usr/share/bash-completion/completions \
    --libexecdir=/usr/lib/$pkgname
  PREFIX=/usr make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}"/usr/share/man/man1
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/lesspipe.sh "${pkgdir}"/etc/profile.d/lesspipe.sh
}
