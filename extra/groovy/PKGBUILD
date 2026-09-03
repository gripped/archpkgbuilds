# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Musikolo <musikolo@hotmail.com>
# Contributor: Ruben Fonseca <fonseka@gmail.com>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: YongMing Zhang

pkgname=groovy
pkgver=5.1.0
pkgrel=1
pkgdesc='Programming language for the Java platform, inspired by Python, Ruby and Smalltalk'
arch=(any)
url='https://groovy-lang.org/'
license=(Apache-2.0)
depends=(java-environment)
makedepends=(gendesk)
optdepends=('groovy-docs: html and pdf documentation for Groovy')
validpgpkeys=('34441E504A937F43EB0DAEF96A65176A0FB1CD0B') # Paul King <paulk@apache.org>
source=("https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-$pkgname-binary-$pkgver.zip"
        "https://downloads.apache.org/groovy/$pkgver/distribution/apache-$pkgname-binary-$pkgver.zip.asc")
sha256sums=('c0d709a36d95a5576e06c5d2163d86f747d0006b12b499d7c198943288102f40'
            'SKIP')
b2sums=('0bbde3e25e5fefcb6a3901fa7cd4ac578307c64fdb89cba9712417de1773020095eea89d813dcd7e38d0567c4bb2354b3e86ef6dbe3d5b09ddadba5e8e6705b3'
        'SKIP')

prepare() {
  gendesk -f -n \
    --pkgname $pkgname \
    --pkgdesc 'Groovy programming language' \
    --exec groovyConsole \
    --name 'Groovy Console'

  # Modify environment variables in the included scripts
  for f in $pkgname-$pkgver/bin/*; do
    sed 's:bin/env\ sh:bin/env\ sh\nGROOVY_HOME=/usr/share/groovy\nexport _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=gasp $_JAVA_OPTIONS":' -i "$f"
  done
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir/usr/"{bin,share/groovy}
  cp bin/* "$pkgdir/usr/bin"
  cp -r lib conf "$pkgdir/usr/share/groovy"
  rm -v "$pkgdir"/usr/bin/*completion
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir"/usr/share/applications
  install -Dm644 bin/*completion -t "$pkgdir"/usr/share/bash-completion/completions
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  find "$pkgdir" -name '*.bat' -type f -exec rm -v {} \;
}
