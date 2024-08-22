# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Adopted from aur/python-jsonpath-ng, original contributors:
# Contributor: Paul Irofti <paul@irofti.net>

_name=jsonpath-ng
pkgname="python-$_name"
pkgver=1.6.1
pkgrel=3
pkgdesc="JSONPath for Python that aims to be standard compliant"
arch=('any')
url="https://github.com/h2non/jsonpath-ng"
# https://github.com/h2non/jsonpath-ng/blob/v1.6.1/setup.py#L16
license=('Apache-2.0')
depends=('python' 'python-ply')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("git+https://github.com/h2non/jsonpath-ng.git#tag=v$pkgver")
sha256sums=('19d2c157bb7ecefc0caf3ec5a94e32a16225cbf3420cb9cb4b69cb232ea10beb')

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
