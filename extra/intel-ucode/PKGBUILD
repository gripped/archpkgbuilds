# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=intel-ucode
pkgver=20250812
pkgrel=1
pkgdesc='Microcode update files for Intel CPUs'
arch=('any')
url='https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files'
replaces=('microcode_ctl')
makedepends=('iucode-tool')
license=('custom')
source=("${url}/archive/refs/tags/microcode-${pkgver}.tar.gz")
sha256sums=('a8358422c68cc4d15c26db1ef682fbce332c3f46c4e087a79c132c437ec5f407')

build() {
  cd Intel-Linux-Processor-Microcode-Data-Files-microcode-${pkgver}

  rm -f intel-ucode{,-with-caveats}/list
  mkdir -p kernel/x86/microcode
  iucode_tool --write-earlyfw=intel-ucode.img intel-ucode{,-with-caveats}/
}

package() {
  cd Intel-Linux-Processor-Microcode-Data-Files-microcode-${pkgver}

  install -vDm 644 $pkgname/* -t "$pkgdir/usr/lib/firmware/$pkgname/"

  install -D -m0644 intel-ucode.img "${pkgdir}"/boot/intel-ucode.img
  install -D -m0644 license "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
