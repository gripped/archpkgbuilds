# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=eclipse-ecj
pkgver=4.38
pkgrel=1
_date=202512010920
pkgdesc='Eclipse java bytecode compiler'
arch=(any)
license=(EPL-2.0)
url=https://www.eclipse.org/
source=(
  https://archive.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/ecj-${pkgver}.jar
  https://archive.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/checksum/eclipse-${pkgver}-SUMSSHA512
  ecj
)
sha512sums=('41d5cea69f9bdc75eee3b5e89bf29ae9cbfe8de9f1ccdc94ea9364c182463bc4003fdee19b23c17b9ddc7c8950f4d196bb4cf3d8a5c2d1af56a769905385e906'
            'b8272a601c268204c511f168f935374a4ab9cb70ef2480f9d978d368170ee12b98cd4259833756131efbcf8b01880b586a4ad7829c374c6e234f546a67068dab'
            '1895c12c63262a08a2c889bb1db61308b5cb8846e5f20e584cde6878afd4da5ee051045a61a0a5a4498146a7315c8a14bf120e5d369365f4efc573d371381846')

prepare() {
  local _source_file_sum=$(grep -m 1 ecj-${pkgver}.jar eclipse-${pkgver}-SUMSSHA512 | cut -d ' ' -f 1)
  if [[ "${sha512sums[0]}" != "${_source_file_sum}" ]]; then
    msg "Checksums do not match"
    exit 1
  fi
}

package() {
  depends=(java-runtime)

  install -Dm 644 ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/eclipse-ecj-${pkgver}.jar
  ln -s eclipse-ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/ecj.jar
  ln -s eclipse-ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/eclipse-ecj.jar
  install -Dm 755 ecj -t "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
