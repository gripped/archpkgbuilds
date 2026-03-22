# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

_pkgname=requests-futures
pkgname=python-requests-futures
pkgver=1.0.1
pkgrel=5
pkgdesc='Asynchronous Python HTTP Requests for Humans using Futures'
arch=('any')
url='https://github.com/ross/requests-futures'
license=('Apache-2.0')
depends=('python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'pifpaf' 'httpbin')
source=("git+https://github.com/ross/requests-futures.git#tag=v$pkgver")
sha256sums=('9fb481df169e4e8890adb1c96621eea29cfdf8651753623529df484f55b8abc8')

build() {
  cd requests-futures
  python -m build --wheel --no-isolation
}

check() {
  cd requests-futures
  eval `pifpaf run httpbin`
  HTTPBIN_URL="${PIFPAF_URLS}/" pytest
  pifpaf_stop
}

package() {
  cd requests-futures
  python -m installer --destdir="$pkgdir" dist/*.whl
}
