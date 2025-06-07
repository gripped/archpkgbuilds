# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-poetry-dynamic-versioning
pkgver=1.8.2
pkgrel=1
pkgdesc='Plugin for Poetry to enable dynamic versioning based on VCS tags'
arch=('any')
url='https://github.com/mtkennerly/poetry-dynamic-versioning'
license=('MIT')
depends=(
  'python'
  'python-dunamai'
  'python-tomlkit'
  'python-jinja'
  'python-poetry'
  'python-cleo'
  'python-poetry-core'
  'python-packaging'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-pytest'
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('894ae0e5cf0449da330b96450f821b4eb414add641b46e7b98e0c3869aaab94dc8fc1b74fe73a20f144648f8e04c9546561b9fea5808c483798b3ca71d0253c0')
b2sums=('4e3306f2b192f0fcc518dfd50e1662c1600d25c260229335e3ccccd3edd45f2a23454140ca31b4ab3401b2fdd2e9707b33c52dbc0bd3d6dfda772ec8cecb6a1f')

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
