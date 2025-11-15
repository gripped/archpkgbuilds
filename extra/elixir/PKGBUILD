# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Gilbert Kennen <gilbert firewatcher org>

pkgname=elixir
pkgver=1.19.3
pkgrel=1
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
)
sha256sums=('a76299ec8d14b43a84a03b3b700b9f912a64912f03ced8e024ae267b7e40c26d')
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
