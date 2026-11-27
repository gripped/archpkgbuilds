# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=restic
pkgver=0.20.0
pkgrel=1
pkgdesc="Fast, secure, efficient backup program"
arch=('x86_64' 'aarch64')
url="https://github.com/restic/restic"
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
checkdepends=('fuse2')
optdepends=('fuse2: mount archive')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/restic/restic/archive/v${pkgver}.tar.gz")
sha512sums=('e5a8a64fd15216308284d7a698bd588c0803382e818fb04e8f874b8737bcea7549019bf3858bb7927bc89ec3f137ee01c6006f6284421a0a48f760bef37d53cf')
b2sums=('d055728c24f96dacc673007b90354b727c36f18d9c14b57222d5774b4f08ad194848299b261281e0448a0f0b956041b5e8dfb556a8a90cff87ce152908ba468b')

build(){
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X 'main.version=${pkgver}'" ./cmd/...
}

check(){
  cd "${pkgname}-${pkgver}"
  go test ./cmd/... ./internal/... || true
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 restic "${pkgdir}/usr/bin/restic"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/man/man1/" doc/man/*.1
  install -Dm644 doc/zsh-completion.zsh "$pkgdir/usr/share/zsh/site-functions/_restic"
  install -Dm644 doc/bash-completion.sh "$pkgdir/usr/share/bash-completion/completions/restic"
  install -Dm644 doc/fish-completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/restic.fish"
}
