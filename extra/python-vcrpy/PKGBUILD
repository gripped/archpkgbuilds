# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-vcrpy
pkgver=9.3.2
pkgrel=1
pkgdesc='Automatically mock your HTTP interactions to simplify and speed up testing'
arch=('any')
license=('MIT')
url='https://github.com/kevin1024/vcrpy'
depends=('python' 'python-pyyaml' 'python-wrapt')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-aiohttp' 'python-boto3' 'python-httpx' 'python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-httpbin' 'python-requests' 'python-tornado')
source=("git+https://github.com/kevin1024/vcrpy.git#tag=v$pkgver")
sha512sums=('46a5148932cf75d4b32febf03591d0ce9ac87253e7f63e855c46705ffef570d23673ee2979fcbbf8d40d08b1118aeb24a43864e3c0d0adfe92f01b231b2705f1')

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
