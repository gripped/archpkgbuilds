# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Petrov Roman <nwhisper@gmail.com>
# Contributor: Andrea Fagiani <andfagiani _at_ gmail dot com>
# Contributor: Larry Hajali <larryhaja@gmail.com>

pkgname=calibre
pkgver=8.7.0
pkgrel=8
pkgdesc='Ebook management application'
arch=(x86_64)
url=https://calibre-ebook.com
license=(GPL-3.0-only)
_pydeps=(apsw
         beautifulsoup4
         css-parser
         cssselect
         dateutil
         dnspython
         faust-cchardet
         feedparser
         html2text
         html5-parser
         jeepney
         lxml
         lxml-html-clean
         markdown
         mechanize
         msgpack
         netifaces
         pdftotext
         pillow
         psutil
         py7zr
         pychm
         pycryptodome
         pygments
         pykakasi
         pyqt6
         pyqt6-webengine
         regex
         unrardll
         xxhash
         zeroconf
         zstandard)
depends=(hunspell
         hyphen
         icu
         jxrlib
         libmtp
         libstemmer
         libusb
         libwmf
#        mathjax
         mtdev
         optipng
         podofo
         "${_pydeps[@]/#/python-}"
         qt6-imageformats
         qt6-multimedia
         qt6-speech
         qt6-svg
         qt6-webengine
         ttf-liberation
         uchardet
         udisks2
         zstd)
makedepends=(cmake
             pyqt-builder
             rapydscript-ng
             sip
             xdg-utils)
checkdepends=(poppler
              python-fonttools
              speech-dispatcher
              tk)
optdepends=('poppler: required for converting pdf to html'
            'python-fonttools: required for font subset feature in epub editor'
            'speech-dispatcher: TTS support in the viewer')
conflicts=(calibre-common
           calibre-python3)
replaces=("${conflicts[@]}")
_archive="$pkgname-$pkgver"
source=("https://download.calibre-ebook.com/$pkgver/$_archive.tar.xz"
        "$url/signatures/$_archive.tar.xz.sig"
         qt-6.10.patch)
sha256sums=('2cfe587e3773d8607fe8bbefbcd77b5cfb816124cac89e491353deb8f2fa9324'
            'SKIP'
            '5b1b0b0d60400727136e929b941bac0b32125c9636600c2f9ec1a1d7fd74db64')
validpgpkeys=('3CE1780F78DD88DF45194FD706BC317B515ACE7C') # Kovid Goyal (New longer key) <kovid@kovidgoyal.net>

prepare(){
	cd "$_archive"
	# Desktop integration (e.g. enforce arch defaults)
	# Use uppercase naming scheme, don't delete config files under fakeroot.
	sed -e "/import config_dir/,/os.rmdir(config_dir)/d" \
		-e "s/'ctc-posml'/'text' not in mt and 'pdf' not in mt and 'xhtml'/" \
		-e "s/^Name=calibre/Name=Calibre/g" \
		-i  src/calibre/linux.py
	# Remove unneeded files
	rm -f resources/$pkgname-portable.*

        patch -p1 -i ../qt-6.10.patch
}

build() {
	cd "$_archive"
	export LANG='en_US.UTF-8'
	python setup.py build
	python setup.py iso639
	python setup.py iso3166
        # the liberation fonts directory is deleted later, but this step is necessary to prevent the setup from downloading them
	python setup.py liberation_fonts --system-liberation_fonts --path-to-liberation_fonts /usr/share/fonts/liberation
#	MathJax 4 not supported
#	python setup.py mathjax --system-mathjax --path-to-mathjax /usr/share/mathjax
	python setup.py mathjax
	python setup.py gui
}

check() {
	cd "$_archive"
	export LANG='en_US.UTF-8'
	python setup.py test --under-sanitize --exclude-test-name test_piper
	python setup.py test_rs
}

package() {
	cd "$_archive"
	export LANG='en_US.UTF-8'
	# If this directory doesn't exist, zsh completion won't install.
	install -d "$pkgdir/usr/share/zsh/site-functions"
	python setup.py install \
		--staging-root="$pkgdir/usr" \
		--prefix=/usr \
		--system-plugins-location=/usr/share/calibre/system-plugins
	cp -a man-pages/ "$pkgdir/usr/share/man"
	# not needed at runtime
	rm -r "$pkgdir/usr/share/calibre/rapydscript/"
	# actual font files provided by system package
	rm -r "$pkgdir/usr/share/calibre/fonts/liberation/"
	# Compiling bytecode FS#33392
	# This is kind of ugly but removes traces of the build root.
	while read -rd '' _file; do
		_destdir="$(dirname "${_file#${pkgdir}}")"
		python -m compileall -d "${_destdir}" "${_file}"
		python -O -m compileall -d "${_destdir}" "${_file}"
	done < <(find "$pkgdir/usr/lib/" -name '*.py' -print0)
}
