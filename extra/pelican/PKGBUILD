# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=pelican
pkgver=4.10.2
pkgrel=2
pkgdesc="A tool to generate a static blog, with restructured text (or markdown) input files."
arch=('any')
url="https://blog.getpelican.com/"
license=('AGPL3')
makedepends=('python-build' 'python-installer' 'python-sphinx' 'python-sphinxext-opengraph' 'python-pdm-backend')
depends=('python-jinja' 'python-pygments' 'python-feedgenerator'
         'python-docutils' 'python-blinker' 'python-unidecode'
         'python-dateutil' 'python-rich' 'python-watchfiles' 'python-ordered-set')
checkdepends=('python-lxml' 'git'
              'python-feedparser' 'python-markdown' 'python-typogrify' 'python-pytest-xdist' 'python-beautifulsoup4')
optdepends=('python-markdown: Markdown support'
            'asciidoc: AsciiDoc support'
            'python-beautifulsoup4: importing from wordpress/dotclear/posterous'
            'python-feedparser: importing from feeds'
#            'python-rst2pdf: PDF generation' # FS#48890
            'openssh: uploading through SSH'
            'rsync: uploading through rsync+SSH'
            'lftp: uploading through FTP'
            's3cmd: uploading through S3'
            'python-invoke: Task parallelism'
            'python-ghp-import: uploading through gh-pages'
            'python-typogrify: typographical enhancements'
            'pandoc: for pelican-import auto convert'
            'python-mdx-video: easier embedding of youtube videos in markdown')
source=("$pkgname-$pkgver.tar.gz::https://github.com/getpelican/pelican/archive/$pkgver.tar.gz")
sha512sums=('ae9794997093c7d193cb48e629127d1fa9443984b496f287330f5101e5da5c5ef7d8ac6170ce14ede31e0eaa9c14b844c2cf49b43e3b68e81848c08dd163ac1d')

build() {
    cd $pkgname-$pkgver
    python -m build -wn

    # sphinx tried to import pelican, make it happy
    cd docs
    PYTHONPATH=".." make man
    PYTHONPATH=".." make text
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    LANG=en_US.UTF-8 python -m installer --destdir="$pkgdir" dist/*.whl

    cd "docs"

    install -d "$pkgdir/usr/share/man/man1/"
    install -Dm644 _build/man/*.1 "$pkgdir/usr/share/man/man1/"

    install -d "$pkgdir/usr/share/doc/pelican/"
    install -Dm644 _build/text/*.txt "$pkgdir/usr/share/doc/pelican/"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest -v -k 'not test_blinker_is_ordered'
}
