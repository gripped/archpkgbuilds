# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-httpx
pkgver=0.35.0
pkgrel=3
pkgdesc='Send responses to httpx'
arch=('any')
license=('MIT')
url='https://colin-b.github.io/pytest_httpx'
depends=('python-httpx' 'python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest-asyncio')
source=("https://github.com/Colin-b/pytest_httpx/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9d991f14654db8deb2ce7f6974efc2aaa9c2f0243c1eef10e1e0ebef4fcce11d886c92b086d122121aaa2b5b8711abdbc6cc7e017296f24a1c1257554821f3b3')

build() {
  cd pytest_httpx-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it

  cd pytest_httpx-$pkgver
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest_httpx-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
