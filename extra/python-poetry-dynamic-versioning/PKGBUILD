# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-poetry-dynamic-versioning
pkgver=1.10.0
pkgrel=1
pkgdesc='Plugin for Poetry to enable dynamic versioning based on VCS tags'
arch=(any)
url='https://github.com/mtkennerly/poetry-dynamic-versioning'
license=(MIT)
depends=(
  python
  python-dunamai
  python-tomlkit
  python-jinja
  python-poetry
  python-cleo
  python-poetry-core
  python-packaging
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
checkdepends=(
  python-pytest
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('2e414ca0de12246eb299ab9fe3e8fc147b9a02e661a27dcf4121b4d04bbc1da5254c3b5dffbd1d4e1ee1f137b3d83d63d7bc344e120246a0c38c15173ff753a9')
b2sums=('cb7618dc7d85e4f5cf632a656082558c504fcd9646771aa3aa56470f151b5a1283cf4e8fe853b03a33fc1529e43d4731a258d2824bcaecf8a3ce4477414ec1db')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

# poetry-related stuff is just icky
#check() {
#  cd "$pkgname"
#
#  # integration tests are sketchy
#  pytest -v tests/test_unit.py
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
