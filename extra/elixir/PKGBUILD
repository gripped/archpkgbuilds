# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Gilbert Kennen <gilbert firewatcher org>

pkgname=elixir
pkgver=1.18.2
pkgrel=1
pkgdesc="A dynamic, functional language for building scalable and maintainable applications"
url="https://elixir-lang.org"
license=('Apache-2.0')
arch=('any')
depends=('erlang-nox')
checkdepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/elixir-lang/elixir/archive/v${pkgver}.tar.gz")
sha256sums=('efc8d0660b56dd3f0c7536725a95f4d8b6be9f11ca9779d824ad79377753e916')

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
