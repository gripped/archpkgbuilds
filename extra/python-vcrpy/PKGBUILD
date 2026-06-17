# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vcrpy
pkgver=8.2.0
pkgrel=1
pkgdesc='Automatically mock your HTTP interactions to simplify and speed up testing'
arch=('any')
license=('MIT')
url='https://github.com/kevin1024/vcrpy'
depends=('python' 'python-pyyaml' 'python-wrapt')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-aiohttp' 'python-boto3' 'python-httpx' 'python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-httpbin' 'python-requests' 'python-tornado')
source=("git+https://github.com/kevin1024/vcrpy.git#tag=v$pkgver")
sha512sums=('39e873fcf6bf4a524357dde8d66a79dde20c61832fc18fdb66569b19dbfaaf271e0f3ed7400f80e18ac89597babb7c08675688661ac87664932f4a379ffdb9ce')

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
