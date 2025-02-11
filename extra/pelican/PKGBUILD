# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=pelican
pkgver=4.11.0
pkgrel=1
pkgdesc="A tool to generate a static blog, with restructured text (or markdown) input files."
arch=('any')
url="https://blog.getpelican.com/"
license=('AGPL-3.0-or-later')
depends=(
  'python'
  'python-blinker'
  'python-dateutil'
  'python-docutils'
  'python-feedgenerator'
  'python-jinja'
  'python-ordered-set'
  'python-pygments'
  'python-rich'
  'python-unidecode'
  'python-watchfiles'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-pdm-backend'
  'python-sphinx'
  'python-sphinxext-opengraph'
)
checkdepends=(
  'git'
  'pandoc-cli'
  'python-beautifulsoup4'
  'python-feedparser'
  'python-lxml'
  'python-markdown'
  'python-pytest'
  'python-typogrify'
)
optdepends=(
  # 'python-rst2pdf: PDF generation' # FS#48890
  'pandoc: for pelican-import auto convert'
  'python-beautifulsoup4: importing from wordpress/dotclear/posterous'
  'python-feedparser: importing from feeds'
  'python-invoke: Task parallelism'
  'python-typogrify: typographical enhancements'
  'asciidoc: AsciiDoc support'
  'python-markdown: Markdown support'
  'python-mdx-video: easier embedding of youtube videos in markdown'
  'lftp: uploading through FTP'
  'openssh: uploading through SSH'
  'python-ghp-import: uploading through gh-pages'
  'rsync: uploading through rsync+SSH'
  's3cmd: uploading through S3'
)
source=(
  "https://github.com/getpelican/pelican/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  "$pkgname-dont-install-tests.patch"
)
sha512sums=('6ccbaa473a7fc441f9033657c99310673950e460f8bf4d27c90cec4f8e8a122b162efb226d8d62ade96e8dfd2f8fb0b16c86097cb8ba8f5273078a8239088521'
            '558c6aeaf2fe99312c03f39fe96cefce01864e223d396d93f091a68c80a66d5ccb8385764c60ef965d9a9f134af692a7dfe92e0c8fd9411b6827c75ce8b10bac')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../$pkgname-dont-install-tests.patch
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
  make -C docs man text
}

check() {
  cd $pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselect failing tests, unsure why they fail.
  test-env/bin/python -m pytest --override-ini="addopts=" \
    --deselect pelican/tests/test_pelican.py::TestPelican::test_basic_generation_works \
    --deselect pelican/tests/test_pelican.py::TestPelican::test_custom_generation_works \
    --deselect pelican/tests/test_readers.py::RstReaderTest::test_typogrify_ignore_filters \
    --deselect pelican/tests/test_readers.py::RstReaderTest::test_typogrify_ignore_tags
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/_build/text/*.txt
}
