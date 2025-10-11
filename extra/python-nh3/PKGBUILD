# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-nh3
pkgver=0.3.1
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
sha512sums=('240fc587deaebbac3dcd9dd163b9b9cfe982d6bf68e515b0a000cce6b49b09312217be12aa5acb56e6eeb9d58f2e30164726be4c38a2619318442b269464fd4e')
b2sums=('bb4d74aa1d0e5c5f9e3814a0ac98215eebb2b07ee42544a3bfb0cf30696f59a5a43195017c39c94c136c31f5235a8f3fb26a6fb2e2d2830727de38c694fafa2e')

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
