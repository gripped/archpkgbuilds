# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Adopted from aur/python-jsonpath-ng, original contributors:
# Contributor: Paul Irofti <paul@irofti.net>

_name=jsonpath-ng
pkgname="python-$_name"
# https://github.com/h2non/jsonpath-ng/releases
pkgver=1.7.0
pkgrel=2
pkgdesc="JSONPath for Python that aims to be standard compliant"
arch=('any')
url="https://github.com/h2non/jsonpath-ng"
# https://github.com/h2non/jsonpath-ng/blob/v1.6.1/setup.py#L16
license=('Apache-2.0')
depends=('python' 'python-ply')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/h2non/jsonpath-ng.git#tag=v$pkgver")
sha256sums=('322858dff5cbbcc2b1ac02ecadd94ed85e3847daaf4cba9df92e286108e69b07')

build() {
  cd "$srcdir/$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_name"
  pytest
}

package() {
  cd "$srcdir/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 et:
