# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Musikolo <musikolo@hotmail.com>
# Contributor: Ruben Fonseca <fonseka@gmail.com>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Contributor: YongMing Zhang

pkgname=groovy
pkgver=5.0.8
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
sha256sums=('3b754e2ba201bcb8d31401a403a8b0a8e41c97de108eb1b49fc1e2b6e96b252b'
            'SKIP')
b2sums=('c963c07e3dad35bf12733d04f975b15785c749006024cbb85b1fde3393c689a45f677dc3a05d6f5e5815445fd8c709dc85c4cf0250e4d871b496fd0c61aa38ca'
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
