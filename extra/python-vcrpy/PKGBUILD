# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vcrpy
pkgver=8.1.1
pkgrel=1
pkgdesc='Automatically mock your HTTP interactions to simplify and speed up testing'
arch=('any')
license=('MIT')
url='https://github.com/kevin1024/vcrpy'
depends=('python' 'python-pyyaml' 'python-wrapt')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-aiohttp' 'python-boto3' 'python-httpx' 'python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-httpbin' 'python-requests' 'python-tornado')
source=("git+https://github.com/kevin1024/vcrpy.git#tag=v$pkgver")
sha512sums=('ec88815f7441c16459b43c6bdccf6598c5524a58a416b944d9a8bce97f563815b4a947ce10dcf84c2d49d4615439f75a77c7299107c1ef420dcf02980cbbb507')

build() {
  cd vcrpy
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # we don't want to download the internet
    --ignore tests/integration
    -m 'not online'
     -W ignore::DeprecationWarning
  )

  cd vcrpy
  PYTHONPATH=".:$PYTHONPATH" pytest "${pytest_options[@]}" tests
}

package() {
  cd vcrpy
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
