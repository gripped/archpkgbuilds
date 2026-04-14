# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Frederik “Freso” S. Olesen <freso.dk@gmail.com>

pkgname=python-mediafile
pkgver=0.16.1
pkgrel=1
pkgdesc='Elegant audio file tagging'
arch=(any)
url='https://github.com/beetbox/mediafile'
license=(MIT)
depends=(
  python
  python-mutagen
  python-filetype
)
makedepends=(
  git
  python-build
  python-poetry-core
  python-installer
)
checkdepends=(python-pytest)
source=("$pkgname::git+https://github.com/beetbox/mediafile#tag=v$pkgver")
sha512sums=('3e1d4dc8dc9a4d393873c3f8905db28c81104d7e150557adcddb34bb7bb52b1689de3a6a87de8cc288846ab1ae86f18002583c7c689f096cbdab254735296d49')
b2sums=('3bd517294ce5ce51b6b0dd07368fdf82a1afc89fe0245e418a0deb6147eaa1e7b78f464a96196d63845d4bca92ddda9812094b39475b9cac1a449386fb630d14')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim: ts=2 sw=2 et:
