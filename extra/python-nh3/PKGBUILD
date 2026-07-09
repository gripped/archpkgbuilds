# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-nh3
pkgver=0.3.6
pkgrel=1
pkgdesc='Ammonia HTML sanitizer Python binding'
arch=(x86_64)
url='https://github.com/messense/nh3'
license=(MIT)
depends=(
  libgcc
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
sha512sums=('72c50455c2622f07ad69095dc25a107958a35405d0fa5d56dc06ca3d304aaf5df7419ed3b33543497ad4aa052aca5c5bdfeefd9ba97c80d09637d7f6c7dd5a81')
b2sums=('993a183e5e7b0e57fff1f448eb0310193c46124106360cc8135bed82a7661aed41ad89a5caf05285ab5928e4a681cffb723670ce78dbd90abb5c3b8a1349aef8')

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
