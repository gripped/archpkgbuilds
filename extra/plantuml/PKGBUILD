# Maintainer: Jiachen YANG <farseerfc@gmail.com>
# AUR Contributor: juantascon <juantascon.aur@horlux.org>
# Contributor : Jingbei Li <i@jingbei.li>

pkgname=plantuml
pkgver=1.2024.6
pkgrel=1
pkgdesc="Component that allows to quickly write uml diagrams"
arch=(any)
url="https://plantuml.com/"
license=('GPL-3.0-or-later OR LGPL-3.0-or-later OR Apache-2.0 OR EPL-2.0 OR MIT')
depends=("java-runtime>=8" "bash")
makedepends=("gradle" "java-environment>=8")
source=("https://github.com/plantuml/plantuml/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.run")
sha256sums=('7bb44fc1c53e73b5ac940df5ab47c625eb39453b128686ba456f06d1db361c94'
            'a3fb528f4c719cfd0ff6154c60fd54ce341011d132caf950cc30af4989f6aac8')
optdepends=('plantuml-ascii-math: allow use AsciiMath or JLaTeXMath notation'
            'ditaa: allow use ditaa notation'
            'graphviz: allow use Graphviz/DOT notation')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gradle jar
}

package() {
  install -m 755 -D "$pkgname.run" "$pkgdir/usr/bin/$pkgname"

  cd "$srcdir/$pkgname-$pkgver"
  install -m 644 -D "build/libs/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" plantuml-mit/mit-license.txt
}
