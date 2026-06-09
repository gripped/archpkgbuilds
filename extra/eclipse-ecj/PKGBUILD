# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Alaux <guillaume@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=eclipse-ecj
pkgver=4.40
pkgrel=1
_date=202606010713
pkgdesc='Eclipse java bytecode compiler'
arch=(any)
license=(EPL-2.0)
url=https://www.eclipse.org/
source=(
  https://archive.eclipse.org/eclipse/downloads/drops4/R-${pkgver}-${_date}/ecj-${pkgver}.jar
  ecj
)
sha512sums=('0b2c799e20dbdd074272faf2aed454186f0ad25759c09963350bceea8e9bec0ad9a04693115401cab6a1c9122b94aba6d79d741eef2e003a4149b2fe00f6f158'
            '1895c12c63262a08a2c889bb1db61308b5cb8846e5f20e584cde6878afd4da5ee051045a61a0a5a4498146a7315c8a14bf120e5d369365f4efc573d371381846')

package() {
  depends=(java-runtime)

  install -Dm 644 ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/eclipse-ecj-${pkgver}.jar
  ln -s eclipse-ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/ecj.jar
  ln -s eclipse-ecj-${pkgver}.jar "${pkgdir}"/usr/share/java/eclipse-ecj.jar
  install -Dm 755 ecj -t "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
