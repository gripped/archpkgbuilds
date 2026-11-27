# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python-pylast
pkgver=7.3.0
pkgrel=1
pkgdesc='A Python interface to Last.fm and Libre.fm'
arch=(any)
url='https://github.com/pylast/pylast'
license=(Apache-2.0)
depends=(
  python
  python-httpx2
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
source=("$pkgname::git+https://github.com/pylast/pylast.git#tag=$pkgver")
sha512sums=('061aa6c7fc1493781728e1a69dddde8292c233c1b2fd6c6d6f279e77d2186421a5fc285d50a4e06d342c1928c27660688741e31aabb2efbe8d15c970864d55cf')
b2sums=('6cd7023d20d6e009238a8d50868685e8a97260f72042146bb2ac8e5eed3bb341ba491177b2fea6dc22a1fb455e3daab5fa01caaab6c558fd35200f02eb3f3df1')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim: ts=2 sw=2 et:
