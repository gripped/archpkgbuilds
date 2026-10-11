# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-jsonpatch
pkgver=1.35
pkgrel=1
pkgdesc="An implementation of the JSON Patch format"
arch=("any")
url="https://github.com/stefankoegl/python-json-patch"
license=("BSD-3-Clause")
depends=("python-jsonpointer")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-wheel")
checkdepends=("python-hypothesis")
source=("git+https://github.com/stefankoegl/python-json-patch.git#tag=v$pkgver")
sha512sums=('41cb876acaf0beb0c9958ed5ea60c22a7e9a02617c3947e211e7b71829832b75fdffb0750f3dc442830d693739fa36bc9effc1f62310a89f2a19fc494ca08c4f')

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
