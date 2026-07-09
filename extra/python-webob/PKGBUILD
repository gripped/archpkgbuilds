# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgbase='python-webob'
pkgname=('python-webob' 'python-webob-docs')
pkgver=1.8.10
pkgrel=2
pkgdesc="WSGI request and response object"
arch=('any')
url="https://webob.org/"
license=('MIT')
depends=('python' 'python-legacy-cgi')
makedepends=('python-setuptools' 'python-sphinx' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-webob-docs: documentation')
source=("https://files.pythonhosted.org/packages/source/w/webob/webob-$pkgver.tar.gz")
sha512sums=('a37333d95763b24cd6d435e4dd59a18a8cb3c10c23075d6c79114654c84f38b9e41b36d868e4e3200fba93774529f6f4506b29a04411acaa90a2d14cc668a7ed')

prepare() {
  cp -a webob-$pkgver webob-docs
  sed -i -e "s/pkg_resources.get_distribution('webob').version/'$pkgver'/" \
    -e '/import pkg_resources/d' webob-docs/docs/conf.py
}

build() {
  cd "$srcdir"/webob-$pkgver
  python -m build --wheel --no-isolation

  cd "$srcdir"/webob-docs
  PYTHONPATH="$PWD/src" make -C docs html
}

check() {
  cd webob-$pkgver
  # Deselected test fails under Python 3.14 due to DisconnectionError being
  # raised before IOError.
  PYTHONPATH="$PWD/src" pytest --ignore=docs \
    --deselect=tests/test_in_wsgiref.py::test_interrupted_request
}

package_python-webob() {
  cd webob-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 "docs/license.txt" \
                   "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

package_python-webob-docs() {
  optdepends=()

  cd webob-docs
  _doc_dir="$pkgdir"/usr/share/doc/python-webob
  mkdir -p "$_doc_dir"
  cp -a "docs/_build/html" "$_doc_dir"
  install -D -m644 "docs/license.txt" \
                   "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
