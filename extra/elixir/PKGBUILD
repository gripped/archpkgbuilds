# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Gilbert Kennen <gilbert firewatcher org>

pkgname=elixir
pkgver=1.17.1
pkgrel=1
pkgdesc="a functional meta-programming aware language built on top of the Erlang VM"
url="https://elixir-lang.org"
license=('Apache-2.0')
arch=('any')
depends=('erlang-nox')
checkdepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/elixir-lang/elixir/archive/v${pkgver}.tar.gz")
sha256sums=('7567c7dcedd5e999d2d41bc2ff70626f49ec283af22eda4f347861bccb34c301')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	ERL_EPMD_PORT=5369 make test

	# The elixir test suite starts up epmd and then doesn't kill it again afterwards.
	epmd -port 5369 -kill
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
