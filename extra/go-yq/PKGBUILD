# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Mario Finelli <mario at finel dot li>

pkgname=go-yq
pkgver=4.45.2
pkgrel=1
pkgdesc='Portable command-line YAML processor'
arch=(x86_64)
url=https://github.com/mikefarah/yq
license=(MIT)
depends=(glibc)
makedepends=(
  git
  go
)
conflicts=(yq)
source=("git+$url.git#tag=v$pkgver")
b2sums=('2319160fc52cd583e965d9dd6c10a348d9d94e40458596edda8dbe8ce3b97ea4959648a8609c3f18442a67a86b6fea25010989205b954b20c02981344462cbb4')

prepare() {
  cd yq
  go mod vendor
}

build() {
  cd yq
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

check() {
  cd yq
  go test ./...
}

package() {
  cd yq
  install -Dt "$pkgdir"/usr/bin yq
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md

  ./yq shell-completion bash | install -Dm644 /dev/stdin \
    "$pkgdir"/usr/share/bash-completion/completions/yq
  ./yq shell-completion zsh | install -Dm644 /dev/stdin \
    "$pkgdir"/usr/share/zsh/site-functions/_yq
  ./yq shell-completion fish | install -Dm644 /dev/stdin \
    "$pkgdir"/usr/share/fish/vendor_completions.d/yq.fish
}

# vim:set ts=2 sw=2 et:
