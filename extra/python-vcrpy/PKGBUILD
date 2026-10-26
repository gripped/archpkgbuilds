# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vcrpy
pkgver=8.4.0
pkgrel=1
pkgdesc='Automatically mock your HTTP interactions to simplify and speed up testing'
arch=('any')
license=('MIT')
url='https://github.com/kevin1024/vcrpy'
depends=('python' 'python-pyyaml' 'python-wrapt')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-aiohttp' 'python-boto3' 'python-httpx' 'python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-httpbin' 'python-requests' 'python-tornado')
source=("git+https://github.com/kevin1024/vcrpy.git#tag=v$pkgver")
sha512sums=('cd962f2e1400e4b6c7f5f6510891e1c90b15c4cf695afe01b9ebc8ed04f8c21b61a146bc41999e4b38db690a0a71f3d29dd4728de9143f480138d3323edb93b2')

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
