# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Gilbert Kennen <gilbert firewatcher org>

pkgname=elixir
pkgver=1.20.2
pkgrel=1
pkgdesc="A dynamic, functional language for building scalable and maintainable applications"
url="https://elixir-lang.org"
license=('Apache-2.0')
arch=('any')
depends=('erlang-core')
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
  'git'
)
checkdepends=(
  'erlang-dialyzer'
  'erlang-eunit'
  'rebar3'
)
source=("git+https://github.com/elixir-lang/elixir.git#tag=v${pkgver}")
sha512sums=('cc0cea402b2ea8bdd215a9080d77137f6b314fbdd3b138800affa89bdb8e6a4b20b783f0751f7d34d5b0b3cf4783e1fc670955a0d2171d895c7d14daf4a23de1')

prepare() {
  cd ${pkgname}
  # Fix regex position test for newer PCRE2
  sed -i 's/position 0\$/position [01]$/' lib/elixir/test/elixir/regex_test.exs

  git cherry-pick -n 07e6e1a985c6a5791446066ac92c0c5feadad87d # otp 29 compat
}

build() {
  cd ${pkgname}
  export REBAR3=/usr/bin/rebar3
  make
}

check() {
  cd ${pkgname}
  export REBAR3=/usr/bin/rebar3
  export ERL_EPMD_PORT=5369
  # The test suite creates git fixtures and needs to write global git config.
  # devtools sets GIT_CONFIG_GLOBAL=/dev/null to prevent this.
  unset GIT_CONFIG_GLOBAL GIT_CONFIG_SYSTEM
  make test
  # The elixir test suite starts up epmd and then doesn't kill it again
  # afterwards.
  epmd -port $ERL_EPMD_PORT -kill
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
