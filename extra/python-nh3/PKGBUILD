# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-nh3
pkgver=0.3.4
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
sha512sums=('f8f0e8c25897c4a026933edfda55924449c490d0382933734d578e38ff46a0cfbbbfba1934e268574a7b722d571ff2be80078265bbd0bbb00cbbd1d760351523')
b2sums=('2e9b04df041d6d3200ec0927c687f78e4ebf3d4affe37d4dc5ff97eadf1cf365970ed82dcff912ec5e504b91004cbb048138f3ec87687c20849d3dd9a1243c21')

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
