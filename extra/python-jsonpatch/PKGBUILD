# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-jsonpatch
pkgver=1.38
pkgrel=1
pkgdesc="An implementation of the JSON Patch format"
arch=("any")
url="https://github.com/stefankoegl/python-json-patch"
license=("BSD-3-Clause")
depends=("python-jsonpointer")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-wheel")
checkdepends=("python-hypothesis")
source=("git+https://github.com/stefankoegl/python-json-patch.git#tag=v$pkgver")
sha512sums=('ad8d348083edd71b58c5fb65dfe155db427574d2a326f80c4756793763a777982bd861daf559b68695181e9ee32bd654afbb7c6f2baba61c3dce55b8f16f7cd6')

build() {
  cd python-json-patch
  python -m build --wheel --no-isolation
}

check() {
  cd python-json-patch
  PYTHONPATH=. python -m unittest discover -vs .
  python property_tests.py
}

package() {
  cd python-json-patch
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
