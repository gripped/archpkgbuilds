# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Luca P <meti at lplab.net>

pkgbase=luajson
pkgname=(
  lua52-luajson
)
pkgver=1.3.4
pkgrel=4
pkgdesc="JSON parser/encoder for Lua"
url="https://github.com/harningt/luajson"
arch=(any)
license=(MIT)
makedepends=(
  git
  lua52-lpeg
)
source=("git+$url#tag=$pkgver")
b2sums=('844d8314f8bb8ac7c1c6ff718da81c274987f7e217e6f2ff9e39d0c959c617e63beccf625718a1ae30440732cb2a2011e4fcb25217047b3d5b5e179cbc1877da')

package_lua52-luajson() {
  pkgdesc+=" 5.2"
  depends=(
    lua52-lpeg
  )

  make -C $pkgbase PREFIX=/usr DESTDIR="$pkgdir" \
    INSTALL_LMOD='$(INSTALL_TOP)/share/lua/5.2' \
    INSTALL_CMOD='$(INSTALL_TOP)/lib/lua/5.2' install

  install -Dm644 $pkgbase/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
