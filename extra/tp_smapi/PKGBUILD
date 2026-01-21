# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: xduugu
# Contributor: nh2
# Contributor: Steven Davidovitz <steviedizzle ð gmail đ com>
# Contributor: Nick B <Shirakawasuna ð gmail đ com>
# Contributor: Christof Musik <christof ð senfdax đ de>
# Contributor: Stefan Rupp <archlinux ð stefanrupp đ de>
# Contributor: Ignas Anikevicius <anikevicius ð gmail đ com>

pkgname=tp_smapi
pkgver=0.45
pkgrel=46
pkgdesc="Modules for ThinkPad's SMAPI functionality"
url='https://github.com/evgeni/tp_smapi'
arch=(x86_64)
license=('GPL-2.0-only')
makedepends=(
  git
  linux-headers
)
_commit=2ed5e3b8ae4103e3fbc196fba7c96eba773dd7e1  # master
source=("git+https://github.com/evgeni/tp_smapi#commit=$_commit")
b2sums=('dbe198a983c3e0cc555736ad2f96c424b82984b4ba10f0757bc090e6ac2a9f9e46162abecdaef68b779a39c39b3a6433773fb688ae4c424bcf90b0f021bf8e62')

pkgver() {
  cd tp_smapi
  git describe --tags | sed 's/^tp-smapi\///;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd tp_smapi

  # https://bugs.archlinux.org/task/54975 (kernel has no _GLOBAL_OFFSET_TABLE_):
  # Clear EXTRA_CFLAGS since it defaults to injecting CFLAGS and -fno-plt breaks the modules

  make HDAPS=1 KVER="$(</usr/src/linux/version)" EXTRA_CFLAGS=
}

package() {
  depends=('linux')

  local extradir=/usr/lib/modules/$(</usr/src/linux/version)/extramodules
  cd tp_smapi

  find . -name "*.ko" -exec install -Dt "$pkgdir$extradir" {} +

  # Manually strip and compress kernel module.
  # TODO: Replace with zipkmod option once supported by makepkg.
  find "$pkgdir" -name "*.ko" -exec strip --strip-debug {} +
  find "$pkgdir" -name '*.ko' -exec zstd --rm -19 {} +

  # load module on startup
  echo tp_smapi | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}

# vim:set sw=2 sts=-1 et:
