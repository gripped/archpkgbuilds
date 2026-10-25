# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-jsonpatch
pkgver=1.37
pkgrel=1
pkgdesc="An implementation of the JSON Patch format"
arch=("any")
url="https://github.com/stefankoegl/python-json-patch"
license=("BSD-3-Clause")
depends=("python-jsonpointer")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-wheel")
checkdepends=("python-hypothesis")
source=("git+https://github.com/stefankoegl/python-json-patch.git#tag=v$pkgver")
sha512sums=('5366bd6a6d499c3f1133cd47682c3f465c4a57d9b7ea3f7851bbeff1afb0d3d69d9417f3541bc47b67a8160765b00be78bdcc9579178396dd946925387845290')

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
