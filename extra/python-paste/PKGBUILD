# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python-paste
pkgver=3.11.0
pkgrel=1
pkgdesc="Tools for using a Web Server Gateway Interface stack"
arch=('any')
url="https://pythonpaste.readthedocs.io/"
license=('MIT')
depends=('python')
optdepends=('python-flup: WSGI utilities')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-flup')
source=("git+https://github.com/pasteorg/paste.git#tag=$pkgver")
sha512sums=('63a0b5ad7045637fa050760c0f02b428078f9e4cb4164011c1247b303472d34c3a7aca8742c1169ab62b88ce70c1e307b94c199a32aeb12b8424bca238e59bdf')

build() {
  cd paste
  python -m build --wheel --no-isolation
}

check() {
  cd paste
  pytest
}

package() {
  cd paste
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 docs/license.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
