# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Amr Hassan <amr.hassan@gmail.com>

pkgname=python-pylast
pkgver=7.1.0
pkgrel=1
pkgdesc='A Python interface to Last.fm and Libre.fm'
arch=(any)
url='https://github.com/pylast/pylast'
license=(Apache-2.0)
depends=(
  python
  python-httpx2
)
makedepends=(
  git
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
)
source=("$pkgname::git+https://github.com/pylast/pylast.git#tag=$pkgver")
sha512sums=('9f3129cecc1c62f73206ef96da0d66365f5a69bde26352d5325da31a3aa40854837f0dfe8ccec69d58c090cf4ef2dde8611877c711f59359fe897e9d32e0c380')
b2sums=('a9e4cf8977d77f29a6d148cc14bfc4d46dd674867e56eb56534540b11c49792875bc060c428d5a9bbda9604f225913f49e205608294817dfcc0f3aca942420d1')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim: ts=2 sw=2 et:
