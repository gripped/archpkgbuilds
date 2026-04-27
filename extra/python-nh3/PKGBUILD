# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-nh3
pkgver=0.3.5
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
sha512sums=('f041f8a1f701252fb8e0ced9c1479ee192612b9b1617ca1f0ffc70601d1c4ce9e7bcb3ea527411915491da4a17202eac43021b2ae1e5f9a078fc67dc25fd1fb9')
b2sums=('3ce84a205ff118f1178d7764e2353028461d45387a225e12a83b10003978d76f24f5c1969ca69f111ad3cb666aa40f03231c44c647a2c729de67affe2f448376')

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
