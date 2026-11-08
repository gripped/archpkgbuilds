# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-jsonpatch
pkgver=1.42
pkgrel=1
pkgdesc="An implementation of the JSON Patch format"
arch=("any")
url="https://github.com/stefankoegl/python-json-patch"
license=("BSD-3-Clause")
depends=("python-jsonpointer")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-wheel")
checkdepends=("mypy" "python-hypothesis" "python-simplejson")
source=("git+https://github.com/stefankoegl/python-json-patch.git#tag=v$pkgver")
sha512sums=('a44077410be597f8e33b4d2ca03263b0b67911ee2563f81d05a49e26cb3978c993c472f78f479745db7ca70013d8f9cb34d8559cff9fa10c13ee41be52a5b29c')

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
