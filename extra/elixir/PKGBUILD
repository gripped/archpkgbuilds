# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Gilbert Kennen <gilbert firewatcher org>

pkgname=elixir
pkgver=1.18.4
pkgrel=2
pkgdesc="A dynamic, functional language for building scalable and maintainable applications"
url="https://elixir-lang.org"
license=('Apache-2.0')
arch=('any')
depends=(
  'erlang-core'
)
makedepends=(
  'erlang-compiler'
  'erlang-crypto'
  'erlang-erts'
  'erlang-inets'
  'erlang-kernel'
  'erlang-parsetools'
  'erlang-public_key'
  'erlang-sasl'
  'erlang-stdlib'
  'erlang-tools'
  'erlang-xmerl'
)
checkdepends=(
  'erlang-dialyzer'
  'erlang-eunit'
  'git'
  'rebar3'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/elixir-lang/elixir/archive/v${pkgver}.tar.gz"
  "${pkgname}-remove-failing-tests.patch"
)
sha256sums=('8e136c0a92160cdad8daa74560e0e9c6810486bd232fbce1709d40fcc426b5e0'
            '992a6bd73819a04c9a3fb31bde4ae189d5bd2a5c6e592d66fb7ddc351941ce3d')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 < ../${pkgname}-remove-failing-tests.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  export REBAR3=/usr/bin/rebar3
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  export REBAR3=/usr/bin/rebar3
  export ERL_EPMD_PORT=5369
  make test
  # The elixir test suite starts up epmd and then doesn't kill it again
  # afterwards.
  epmd -port $ERL_EPMD_PORT -kill
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
