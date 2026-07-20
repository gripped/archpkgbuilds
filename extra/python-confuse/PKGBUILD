# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-confuse
pkgver=2.2.1
pkgrel=2
pkgdesc='Painless YAML config files for Python'
arch=(any)
url=https://github.com/beetbox/confuse
license=(MIT)
depends=(
  python
  python-typing_extensions
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
b2sums=('ce87305dbf94d0a324c0c972d8a1388271d2ac1b5bf9eda9738811a6337ca72aa821a03fa8576349629e8215cea9d4d266d64317c92092da6a1d680cf6c46c54')

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
