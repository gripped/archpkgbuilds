# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-syrupy
pkgver=5.5.3
pkgrel=1
pkgdesc="Pytest Snapshot Test Utility"
arch=('any')
license=('MIT')
url="https://github.com/syrupy-project/syrupy"
depends=('python-pytest')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
checkdepends=('python-attrs' 'python-hypothesis' 'python-pydantic' 'python-pytest-xdist')
optdepends=(
  'python-attrs: attrs serializer plugin'
  'python-pydantic: Pydantic serializer plugin'
)
source=("git+https://github.com/syrupy-project/syrupy.git#tag=v$pkgver")
sha512sums=('fbc9cec8a0609640f237050305c11a57e1eefd3b464fd77a9490ea3a7f9887ae687c520e04f7573fe1da02df7dfb3abd300217c16a190121a17d9a11d27ebbbe')

build() {
  cd syrupy
  python -m build -nw
}

check() {
  cd syrupy
  python -m venv tmpenv --system-site-packages
  tmpenv/bin/python -m installer dist/*.whl
  tmpenv/bin/python -m pytest
}

package() {
  cd syrupy
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
