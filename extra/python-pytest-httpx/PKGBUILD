# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-httpx
pkgver=0.26.0
pkgrel=1
pkgdesc='Send responses to httpx'
arch=('any')
license=('MIT')
url='https://colin-b.github.io/pytest_httpx'
depends=('python-httpx' 'python-pytest')
makedepends=('python-setuptools')
checkdepends=('python-pytest-asyncio')
source=("https://github.com/Colin-b/pytest_httpx/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1d6d3337120411bf949bbe5cc84ccfcce0ed4baaa0a0cde4a911d6bfff10f1b4eb526c7c40b2eb4dbdea92ff7c7bba2fceac8715b94fd50c1b02b5acb493be57')

build() {
  cd pytest_httpx-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest_httpx-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest_httpx-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
