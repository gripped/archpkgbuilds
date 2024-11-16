# Maintainer: Morten Linderud <foxboron@arhlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@arhlinux.org>

pkgname=go-md2man
pkgver=2.0.5
pkgrel=1
pkgdesc='A markdown to manpage generator'
arch=('x86_64')
url='https://github.com/cpuguy83/go-md2man'
license=('MIT')
makedepends=('go')
source=($pkgname-$pkgver.tar.gz::"https://github.com/cpuguy83/go-md2man/archive/v$pkgver.tar.gz")
sha256sums=('6bb799e8fff06d82ca4617190157338d336e2361aa6c5b1786f763a684ffc3f2')

build() {
  cd "$pkgname-$pkgver"
  export GOFLAGS="-buildmode=pie -trimpath"
  export CGO_LDFLAGS="$LDFLAGS"
  go build -o go-md2man .
  ./go-md2man -in=go-md2man.1.md -out=go-md2man.1
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 go-md2man "$pkgdir/usr/bin/go-md2man"
  install -Dm755 go-md2man.1 "$pkgdir/usr/share/man/man1/go-md2man.1"
  install -Dm755 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
