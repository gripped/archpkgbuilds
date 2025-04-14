# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=anubis
pkgver=1.16.0
pkgrel=1
pkgdesc="Reverse proxy to protect against scraper bots"
url="https://anubis.techaro.lol/"
arch=(x86_64)
license=(MIT)
depends=(glibc)
makedepends=(
  brotli
  esbuild
  git
  go
  gzip
  npm
  zstd
)
backup=(etc/anubis/default.env)
source=("git+https://github.com/TecharoHQ/anubis#tag=v$pkgver")
b2sums=('c1fa33d951b2df4be2881697e6163b6935fa008347e6edeb7ec15b9f75193cc2b82e0de9fce2acd5ed074cf01e487e4b259fae7c5db5adbe5f18751b16de432d')

prepare() {
  cd anubis
  make deps
}

build() {
  cd anubis

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  make assets
  make prebaked-build
}

package() {
  cd anubis

  install -D var/anubis -t "$pkgdir/usr/bin"

  install -Dm644 run/anubis@.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 run/default.env -t "$pkgdir/etc/anubis"

  local docs=(
    README.md
    data/botPolicies.json
    docs/docs/CHANGELOG.md
    docs/docs/admin/{policies.md,native-install.mdx}
  )
  install -Dm644 "${docs[@]}" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
