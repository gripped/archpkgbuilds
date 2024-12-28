# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-poetry-dynamic-versioning
pkgver=1.4.1
pkgrel=2
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
sha512sums=('4bed9c7a9ef8fe57a1cc7760ffb8da7c4d501a0db8bfbd88bc05f96c1670eebb2dc061ed479b19fd5c6522e3efff87dc609b0e220f2079531033fdb45c3fc6dc')
b2sums=('eb8098c2732d7db85bc33bb3e336e0f4f1f0960da7a143ac715a1bc6a8c20eab4341e615942b7c72b7907299344723ac278e5ea1f7f57296dfca959799063724')

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
