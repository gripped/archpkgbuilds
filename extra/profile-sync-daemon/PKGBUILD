# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=profile-sync-daemon
pkgver=7.03
pkgrel=1
epoch=1
pkgdesc="Symlinks and syncs browser profile dirs to RAM"
arch=(any)
url="https://github.com/graysky2/profile-sync-daemon"
license=(MIT)
depends=(
  bash
  findutils
  fuse-overlayfs
  procps-ng
  rsync
  systemd
)
optdepends=('zsh-completions: for completion when using zsh')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('df20c267831daf10c274520da25179c9e899bb4fb5aa54123ea96289e596fb03bd5fa77053ac55059c1d141e7b5a524d6b99a16e4e85e94483798d6f992c9cb6')
b2sums=('d1e46278785865c2f848f06a26f63197226c0d2381dcbf969acbfa3c0eb8edc721c31b6960689e73c6ac9c897fc52a9af3ec14d2edbbbdc0ca9b8376a308eded')

build() {
  make -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
