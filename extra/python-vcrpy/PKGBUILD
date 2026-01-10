# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vcrpy
_name="${pkgname#python-}"
pkgver=7.0.0
pkgrel=3
pkgdesc='Automatically mock your HTTP interactions to simplify and speed up testing'
arch=('any')
license=('MIT')
url='https://github.com/kevin1024/vcrpy'
depends=('python' 'python-pyyaml' 'python-wrapt' 'python-yarl')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-aiohttp' 'python-boto3' 'python-httpx' 'python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-httpbin' 'python-requests' 'python-tornado')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6e82f56adddc5b5e3d56c261e612af5a66daed6a3485dfc082be235e95901ceaae9aa83bab96cef19d8fbe35c27953b4b101fea702fd3a44cbe578c926990d87')

build() {
  cd $_name-$pkgver
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

  cd $_name-$pkgver
  PYTHONPATH=".:$PYTHONPATH" pytest "${pytest_options[@]}" tests
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
