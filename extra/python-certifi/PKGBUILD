# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: William J Bowman <bluephoenix47@gmail.com>

pkgname=python-certifi
pkgver=2024.06.02
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
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('61f2b8ae1b15e8c926329e336e3e542ba1104672bfe653ed06a9e3cfc58485978aa2d0979aea4e041772c0ad213d9e5bb952248045071a54418269eb381b6e0f')
b2sums=('8636cc0398241221ef6bdf1e9ccb8ee7839863a9a39f63f53a20edc295f0bd43104aa5845a6647b5e0f5481443db056bce555544fe19fc9aefd3aa1303ed27b5')

prepare() {
  cd $pkgname-$pkgver
  # Use system CA store. Replacing the copy in the source tree so the test suite is actually run against it.
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
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir"/$site_packages/certifi/cacert.pem

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
