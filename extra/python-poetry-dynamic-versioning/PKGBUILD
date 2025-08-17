# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-poetry-dynamic-versioning
pkgver=1.9.1
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
sha512sums=('06f957d8f9d32685a539f5c1911754745c97e6df6d3aed25d7139c35bf1dac82e2f11f262619af64b76d869658d0d85c99404cb0fae9e1f9c3a4e01d725814f3')
b2sums=('ba22ddf1640a5005e10f6ee5f0f609bfea9a2679f5ccd9683f1f03b896ef96d5ea9eec193011503f2e206d744742dd851ec5bf4e7276acc01ed7af1dde867616')

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
