# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=intel-ucode
pkgver=20250211
pkgrel=1
pkgdesc='Microcode update files for Intel CPUs'
arch=('any')
url='https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files'
replaces=('microcode_ctl')
makedepends=('iucode-tool')
license=('custom')
source=("${pkgname}-${pkgver/./}.tar.gz::https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/archive/microcode-${pkgver/./}.tar.gz")
sha256sums=('1da88b51953c9da2e20b5c94b3d7270cf87ea5babcaa56e3d6a5c9eaf11694b3')

build() {
  cd Intel-Linux-Processor-Microcode-Data-Files-microcode-${pkgver/./}

  rm -f intel-ucode{,-with-caveats}/list
  mkdir -p kernel/x86/microcode
  iucode_tool --write-earlyfw=intel-ucode.img intel-ucode{,-with-caveats}/
}

package() {
  cd Intel-Linux-Processor-Microcode-Data-Files-microcode-${pkgver/./}

  install -vDm 644 $pkgname/* -t "$pkgdir/usr/lib/firmware/$pkgname/"

  install -D -m0644 intel-ucode.img "${pkgdir}"/boot/intel-ucode.img
  install -D -m0644 license "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
