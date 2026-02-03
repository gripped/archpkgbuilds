# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python-pylast
pkgver=7.0.2
pkgrel=1
pkgdesc='A Python interface to Last.fm and Libre.fm'
arch=(any)
url='https://github.com/pylast/pylast'
license=(Apache-2.0)
depends=(
  python
  python-httpx
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
source=("$pkgname::git+https://github.com/pylast/pylast.git#tag=$pkgver")
sha512sums=('6e7094152490a2f82708dec1f304e73281fa0c5420768e97de43c446829f68e748f104129a914dc11044447ffc58f77ed68b4860d1f9a87cefd5fccc50cc407d')
b2sums=('713cf4d4fff535fcedecd26297338285cd4e01d7139cf02b1998a26ab87c675efc0c4b0d6f19dd68eff830cac74d4386a1d32ccd4dae308bee3e78d0d6c5b3f4')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim: ts=2 sw=2 et:
