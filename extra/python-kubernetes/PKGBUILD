# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
pkgver=36.0.2
pkgrel=1
license=('Apache-2.0')
pkgdesc='Python client for the kubernetes API'
arch=('any')
url='https://github.com/kubernetes-client/python'
depends=(
  'python'
  'python-adal'
  'python-aiohttp'
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
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-isort'
  'python-pluggy'
  'python-py'
  'python-pytest'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('86e800b8d27301dd8d39646b12895c4d073a95c7bf13f772ae6d625a76ad1a0923442eda61d85c3d5b99f843838afdab0a6a6851bdfdcbc64b68db5f1832ed67')

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
