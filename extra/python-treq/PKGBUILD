# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-treq
pkgver=25.5.0
pkgrel=1
pkgdesc="A requests-like API built on top of twisted.web's Agent"
arch=('any')
license=('MIT')
url='https://github.com/twisted/treq'
depends=('python' 'python-incremental' 'python-requests' 'python-hyperlink'
         'python-pyopenssl' 'python-service-identity' 'python-idna' 'python-twisted'
         'python-attrs' 'python-typing_extensions' 'python-multipart'
         'python-zope-interface')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'httpbin')
source=("git+https://github.com/twisted/treq.git#tag=treq-$pkgver")
sha512sums=('6c0f6e25019805504fcdedaad3bcb708a2a00b28ec9e7cb9c66322456bf03b78a91cb180edf7fec3969977cae9b8f54dfe802ebaf0f5adf2580d6209861115af')

build() {
  cd treq
  python -m build --wheel --no-isolation
}

check() {
  cd treq
  PYTHONPATH="$PWD/src" trial treq
}

package() {
  cd treq
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
