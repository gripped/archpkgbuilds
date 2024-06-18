# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-django-compressor
_name="${pkgname#python-}"
pkgver=4.5
pkgrel=1
pkgdesc="Compresses linked and inline javascript or CSS into a single cached file"
arch=(any)
url="https://github.com/django-compressor/django-compressor"
license=(MIT)
depends=(
  python
  python-django
  python-django-appconf
  python-rcssmin
  python-rjsmin
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-beautifulsoup4
  python-brotli
  python-calmjs
  python-csscompressor
  python-django-sekizai
  python-html5lib
  python-jinja
  python-lxml
)
optdepends=(
  'python-beautifulsoup4: for compressor.parser.BeautifulSoupParser and compressor.parser.LxmlParser'
  'python-brotli: for compressor.storage.BrotliCompressorFileStorage'
  'python-calmjs: for compressor.filters.jsmin.CalmjsFilter'
  'python-csscompressor: for compressor.filters.cssmin.CSSCompressorFilter'
  'python-django-sekizai: for including template code into main template'
  'python-html5lib: for compressor.parser.Html5LibParser'
  'python-jinja: for jinja2 templating support'
  'python-lxml: for compressor.parser.LxmlParser'
)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
)
sha512sums=('2163d1b0fdd70bf5b7d104ed8031abbf911f74b309d6afd0a09732d6cbf3c009a8f1bd98c969babe71621fb59ef467b40d7743e89a1aa0f3b5529cbae83a2f70')
b2sums=('f6ed0bce7f90a7ebe603f6be5dfe7d060010279f66f4af2b88b1d9b45381c55a4f84a34544398e366f9ae907f3962f0bef35f1971bc25c21a968b39e187b57e8')

prepare() {
  cd $_name-$pkgver
  # we don't support version pinning: https://github.com/django-compressor/django-compressor/issues/1195
  sed -e 's/rcssmin ==/rcssmin >=/;s/rjsmin ==/rjsmin >=/' -i setup.py
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  cd test_dir/$_site_packages
  django-admin test --settings=compressor.test_settings compressor
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
