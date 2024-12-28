# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-py-partiql-parser
_pkgname=py-partiql-parser
# https://github.com/getmoto/py-partiql-parser/blob/main/CHANGELOG.md
pkgver=0.5.6
pkgrel=3
pkgdesc='Python Parser for PartiQL'
arch=(any)
url='https://github.com/getmoto/py-partiql-parser'
# Most files are licensed under MIT, while an Apache 2.0 file is vendored since 0.4.0.
# See: https://github.com/getmoto/py-partiql-parser/pull/12
license=('MIT AND Apache-2.0')
depends=(python)
makedepends=(git python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=("git+https://github.com/getmoto/py-partiql-parser#tag=$pkgver")
sha256sums=('e0f40798453c1f8e6d576aa7c488204f010fefe45769210687acf9767bd31b80')

build() {
  cd $_pkgname

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname

  pytest tests
}

package() {
  cd $_pkgname

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
