# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-stone
pkgver=3.4.0
pkgrel=1
pkgdesc='The Official API Spec Language for Dropbox API V2'
arch=(any)
url='https://github.com/dropbox/stone'
license=(MIT)
depends=(
  python
  python-packaging
  python-ply
  python-jinja
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('802b66d19e17b49e0b482edc86af882baab2d5afff92fea3b6fe15216a479b7abb65a8d03a05acff320c5b817171b154337fd15264e97eff3b58356bdaccad40')
b2sums=('487481a67a33ab0361717292780a1c33c34228c4096519bb64ad01ccca7f4d9dc3c644755a7047725536ec7714584aa74ddd20de300fd77a4584806e3b358969')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -vv
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
