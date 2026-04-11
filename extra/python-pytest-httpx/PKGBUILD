# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-httpx
pkgver=0.36.1
pkgrel=1
pkgdesc='Send responses to httpx'
arch=('any')
license=('MIT')
url='https://colin-b.github.io/pytest_httpx'
depends=('python-httpx' 'python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest-asyncio')
source=("git+https://github.com/Colin-b/pytest_httpx.git#tag=$pkgver")
sha512sums=('1dc4889825e51df0fec08273d98ecb75f31fdaee03f78f126e86cedec695424c6f5671cbf669ae7514b9d50d80087608fe492af1fc3dc7efab3dc3c1c0c94ee2')

build() {
  cd pytest_httpx
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it

  cd pytest_httpx
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest_httpx
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
