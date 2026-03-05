# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=python-click
pkgver=8.3.1
pkgrel=3
pkgdesc="Simple wrapper around optparse for powerful command line utilities"
arch=('any')
url='https://click.palletsprojects.com/'
license=('BSD-3-Clause')
depends=('python')
makedepends=(
  'python-build'
  'python-flit-core'
  'python-installer'
)
checkdepends=('python-pytest')
source=("https://github.com/pallets/click/archive/$pkgver/$pkgname-$pkgver.tar.gz"
         https://github.com/pallets/click/commit/91de59c6c8abc8251e7af551cd4546cc964288af.patch)
b2sums=('39b5d80ccc78fcadc9a9833302e088ddb9829e304881e8d1de2cb88c387c0b51fa887951ddb253824b258ae3f243942baefd8ad7f3b9e3392260951c71abc77f'
        'c446d2106c4a29c8acae977ee55b13d338565db07f8d962c744b56d17d6a28b57c2f50f02f120755a7f66d58aac962aebefb5f3c6f46d1e763053b8258da941c')

prepare() {
  cd ${pkgname#python-}-$pkgver
# Backport fix for optional values
  patch -p1 -i ../91de59c6c8abc8251e7af551cd4546cc964288af.patch
}

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
