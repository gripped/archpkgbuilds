# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-confuse
pkgver=2.1.0
pkgrel=2
pkgdesc='Painless YAML config files for Python'
arch=(any)
url=https://github.com/beetbox/confuse
license=(MIT)
depends=(
  python
  python-yaml
)
makedepends=(
  git
  python-build
  python-poetry-core
  python-installer
)
source=("$pkgname::git+https://github.com/beetbox/confuse#tag=v$pkgver")
sha512sums=('b00725143832118830a58abdce59c845d4de47cbbc6d07f3f08e7a193568123fb1b194c1084ae7b8abf1278113611566cadefc3c2f8077fe358a419c93d309e0')
b2sums=('ebf3c86cc259f70aed99cd13c457161e9cbd73fe33d15eef75592bce8aee6fd3d331ac42fa2ffb9675a59d8e965ac94058fe786a6df3534344a1998ceb500b10')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  python -m unittest discover -vs .
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim: ts=2 sw=2 et:
