# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
pkgver=37.0.2
pkgrel=1
license=('Apache-2.0')
pkgdesc='Python client for the kubernetes API'
arch=('any')
url='https://github.com/kubernetes-client/python'
depends=(
  'python'
  'python-adal'
  'python-aiohttp'
  'python-aiohttp-retry'
  'python-certifi'
  'python-dateutil'
  'python-durationpy'
  'python-google-auth'
  'python-requests'
  'python-requests-oauthlib'
  'python-six'
  'python-urllib3'
  'python-websocket-client'
  'python-yaml'
  'python-pydantic'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('2403fcff8fb27ab74c32a07b4f1ae049cf197884083079a3d7fc3b6c57c3fa36ff6af07d12143bc0e20f849449b34be7813ad4e657dd11c4ef0e9a589587c133')

build() {
  cd python-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd python-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
