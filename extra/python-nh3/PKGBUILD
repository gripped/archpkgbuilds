# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-nh3
pkgver=0.3.2
pkgrel=2
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
sha512sums=('296e3f0d0e7ff78b98df3078ae3dc369a3c889962bf5560759a1454c2d7653a94179cbcbb88177a042498445081884c8967cda21b7378a8d6e1e18c511af4c10')
b2sums=('81619dca7ee3c2bc9a3338b1b65c48eaffed3a41bc837f478ac4c08dd3aacd5cbea77f18dc6da9f797e53e1bada2d7623ad53afba8d04bd8725bf08c900add8f')

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
