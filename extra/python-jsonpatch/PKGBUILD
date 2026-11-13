# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-jsonpatch
pkgver=1.45
pkgrel=1
pkgdesc="An implementation of the JSON Patch format"
arch=("any")
url="https://github.com/stefankoegl/python-json-patch"
license=("BSD-3-Clause")
depends=("python-jsonpointer")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-wheel")
checkdepends=("mypy" "python-hypothesis" "python-simplejson")
source=("git+https://github.com/stefankoegl/python-json-patch.git#tag=v$pkgver")
sha512sums=('bd09d0f917339d75c65da327d9820fc4463d8b8cdf29b2a16319e9ebd2559f26ba8e10f88c6cb08842d317f60d0449d5193839e5c4b515421f36ae9208435a39')

build() {
  cd python-json-patch
  python -m build --wheel --no-isolation
}

check() {
  cd python-json-patch
  PYTHONPATH=. python -m unittest discover -vs .
  python property_tests.py

  # Type checks need the installed jsonpatch-stubs package.
  python -m venv --system-site-packages --without-pip "$srcdir/test-env"
  "$srcdir/test-env/bin/python" -m installer dist/*.whl
  "$srcdir/test-env/bin/python" -m mypy.stubtest --mypy-config-file pyproject.toml jsonpatch
  cd typetests
  "$srcdir/test-env/bin/python" -m mypy --config-file ../pyproject.toml usage.py
}

package() {
  cd python-json-patch
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
