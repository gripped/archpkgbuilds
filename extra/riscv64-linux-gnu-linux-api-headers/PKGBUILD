# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_target_arch=riscv
_target=riscv64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=6.18
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://www.kernel.org'
license=(GPL-2.0-only)
makedepends=('rsync')
source=(https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-$pkgver.tar.{xz,sign})
sha256sums=('9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b'
            'SKIP')
b2sums=('b94b7b9bf18aca0c3e50baf79b009a1448fc6cd9c3ee019f641cc247dcf53a4abef4274ee0608ad8cd4943af69854363a95d26e117ff23620bb07dccb158859f'
        'SKIP')
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

build() {
  cd linux-$pkgver
  make ARCH=$_target_arch mrproper
}

package() {
  cd linux-$pkgver
  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=0 headers_install
}
