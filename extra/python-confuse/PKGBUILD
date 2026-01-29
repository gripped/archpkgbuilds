# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-confuse
pkgver=2.2.0
pkgrel=1
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
checkdepends=(python-pytest)
source=("$pkgname::git+https://github.com/beetbox/confuse#tag=v$pkgver")
sha512sums=('07158115f266ca72d361484637977e8963477b357880387147925fee357486634cfeae03450c1c0a903e9f4b27c32fa787015884f47c604069b3a35fb0bab117')
b2sums=('fc98caa4bbfb99a1b5ee061f05ae25d03320881e8837c715be6a78f2dcee7ca28a7d8114d35bea92b5eeacb277cda978607302f263751d38264eb32f9ef673cf')

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
