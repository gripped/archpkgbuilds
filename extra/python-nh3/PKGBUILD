# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-nh3
pkgver=0.3.0
pkgrel=1
pkgdesc='Ammonia HTML sanitizer Python binding'
arch=(x86_64)
url='https://github.com/messense/nh3'
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
)
checkdepends=(python-pytest)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('7ca2cd86b18aea73e72a3f8fd9f7c39c83114efc5af5f20e5165700c3ecbf0aa3fc53308def3fcfefb88bd9c38ca9f317474082b0b4bc9f75f6e9dd6aa145f8a')
b2sums=('a6ff35e85c628d03f814cba37c9df4cef9e88901c2aca692c710fe072654417e6255a96adb5ea27fb325ba27d3f2eccff62e996277f9f646be4d8661beae5e21')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation 
}
 
check() {
  cd "$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
