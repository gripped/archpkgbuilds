# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Ian Beringer <ian@ianberinger.com>

pkgname=python-kubernetes
pkgver=36.0.1
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
b2sums=('aa2c444e24410aa508d56f33611fd2e58a78f6e3bbb5acf056620975f32c40ea422d45a4d254ddaa56e618fac9d296c6aaaf002f0f69eabf3d78a775e3abd994')

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
