# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: William J Bowman <bluephoenix47@gmail.com>

pkgname=python-certifi
pkgver=2025.07.14
pkgrel=1
pkgdesc="Python package for providing Mozilla's CA Bundle (using system CA store)"
arch=(any)
url="https://github.com/certifi/python-certifi"
license=(MPL-2.0)
depends=(
  ca-certificates
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('4aa6187b71459994d218096de85f6aee6fb09aad605e6f6c7d0c2b44d22bb3341ed4673faf70f42a25fd048a6d0df285e5d16189647caab049812c34e58f13b7')
b2sums=('477951bfa25fea5b2343675e333bd706a3aeec5efca209f2e77e49febbfcbe701ac526fbdd99442cf67bde566552358150b07d93eef7ef1187d054e8b90be4f5')

prepare() {
  cd $pkgname-$pkgver
  # Use system CA store. Replacing the copy in the source tree so the test
  # suite is actually run against it.
  ln -sf /etc/ssl/certs/ca-certificates.crt certifi/cacert.pem
  # Our CA store has non-ASCII comments, but we are not packaging for JVM
  # https://github.com/certifi/python-certifi/issues/50
  sed -i 's/encoding="ascii"/encoding="utf-8"/' certifi/core.py
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Replace CA store here again because the symlink was installed as a file
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir/$site_packages/certifi/cacert.pem"

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
