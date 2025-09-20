# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Sébastien Luttringer

pkgname=python-psutil
pkgver=7.1.0
pkgrel=1
arch=('x86_64')
pkgdesc='A cross-platform process and system utilities module for Python'
url='https://github.com/giampaolo/psutil'
license=('BSD-3-Clause')
depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'net-tools'
  'procps-ng'
  'python-pytest'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/release-$pkgver.tar.gz"
  "$pkgname-dont-package-tests.patch"
)
sha512sums=('06db8809a3fb8bbd7ed6ed0bb94311d83e3d4f07760eaa931ea59ef16cd3ec65ddd3b1b39a28ec21cfffd718a604f53411f4fc19b01b29dcce39eca41e9fafe2'
            'bc902748c8de706a2196f8a19801314f11035c17c8ad406330ba54f821c3ba9144c49d9b7e305d56500576993162c6d148f7db9cf0c61d4fd23b4d85adb3d461')

prepare() {
  cd psutil-release-$pkgver
  patch -Np1 -i ../$pkgname-dont-package-tests.patch
}

build() {
  cd psutil-release-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd psutil-release-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Deselected test fail in a chroot, not sure why.
  # GITHUB_ACTIONS env var skips some tests unsuitable here.
  local site_packages=$(test-env/bin/python -c "import site; print(site.getsitepackages()[0])")
  local relative_site_packages=$(realpath --relative-to="$PWD" "$site_packages")
  cp -r psutil/tests/ "$relative_site_packages/psutil"
  GITHUB_ACTIONS=1 test-env/bin/python -m pytest --override-ini="addopts=" "$relative_site_packages" \
    --deselect "$relative_site_packages/psutil/tests/test_linux.py::TestSystemNetIfAddrs::test_ips" \
    --deselect "$relative_site_packages/psutil/tests/test_system.py::TestNetAPIs::test_net_if_addrs"

}

package() {
  cd psutil-release-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
