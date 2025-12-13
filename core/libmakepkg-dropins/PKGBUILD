pkgname=libmakepkg-dropins
pkgver=18
pkgrel=1
pkgdesc="Features that can be dropped into libmakepkg to extend the functionality of makepkg"
url="https://gitlab.archlinux.org/pacman/libmakepkg-dropins"
arch=(any)
license=(GPL-2.0-or-later)
depends=(
  awk
  bash
  coreutils
  findutils
  grep
  sed
  binutils
)
makedepends=(
  git
)
source=("git+${url}.git#tag=${pkgver}?signed")
sha256sums=('3c99b6674afb573beeeda8d5783c5b7a1bfdc30f4a9a095857e5f2fdf89a2f62')
b2sums=('b6605ea0c9ced423ebd2873a13e67f628495b423b31bc83d61285fcec78b1188c387570bb9142f61a3f5767da7ac7bbfe98883fd2d03b3b2d01318a59b89de24')
validpgpkeys=(
  AC07187AF9155998CF6EFFC7F8112DA85D62567C  # Libmakepkg-Dropins Signer
)

package() {
  cd "$pkgname"

  install -dm755 "$pkgdir/usr/share/makepkg"
  local dir dirs
  mapfile -t dirs < <(find . -mindepth 1 -maxdepth 1 -type d -not -name .git)
  for dir in "${dirs[@]}"; do
    cp -ra "${dir}" --target-directory="$pkgdir/usr/share/makepkg"
  done
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: set ts=2 sw=2 et:
