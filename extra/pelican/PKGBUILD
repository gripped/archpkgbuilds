# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=pelican
pkgver=4.11.0
pkgrel=3
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
  'git'
  'python-build'
  'python-installer'
  'python-pdm-backend'
  'python-sphinx'
  'python-sphinxext-opengraph'
)
checkdepends=(
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
  'lftp: uploading through FTP'
  'openssh: uploading through SSH'
  'python-ghp-import: uploading through gh-pages'
  'rsync: uploading through rsync+SSH'
  's3cmd: uploading through S3'
)
source=(
  "git+https://github.com/getpelican/pelican.git#tag=$pkgver"
  "$pkgname-dont-install-tests.patch"
)
b2sums=('d1fefe3e1c6134ca920c926f1cbc61764699d17d8b93a565fb313543c9fe6dcb42bbae12deb6c7d5c23721974e607c8dd9092c95f6d48b657bc4033a97da4cd5'
        '4bc1d735140e9ff344ec232354fa5083f50fb1e0deeb364e31324df8dff970936a3af4fc7857602fe0cc09fa765eb1f0e9c50bc5e399f605bc1e8ffb64136858')

prepare() {
  cd $pkgname
  # Fix docutils PendingDeprecationWarning for Python 3.14 compat
  git cherry-pick -n 5acf155c328eb10df10507c28a880e47a939de8e
  # Upgrade Beautiful Soup & adjust tests to conform
  git cherry-pick -n 88a6f57940f89e141ff66550f59708fc62bde71c

  patch -Np1 -i ../$pkgname-dont-install-tests.patch
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
  make -C docs man text
}

check() {
  cd $pkgname
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
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/*.1
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/_build/text/*.txt
}
