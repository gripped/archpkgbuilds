# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Sébastien Luttringer

pkgname=python-psutil
pkgver=7.2.1
pkgrel=1
pkgdesc='A cross-platform process and system utilities module for Python'
arch=('x86_64')
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
source=("$url/archive/release-$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('ed56abb3de2b8dbf3e383159795ee84c74d6c5fbdd91ad05752187ee252ccce1e1d1f2b11e1c18b82d4217d4211347e2c8c05d528e4206a2f58a6c9520227ce2')

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
  cp -r tests/ "$relative_site_packages/psutil"
  GITHUB_ACTIONS=1 test-env/bin/python -m pytest --override-ini="addopts=" "$relative_site_packages" \
    --deselect "$relative_site_packages/psutil/tests/test_linux.py::TestSystemNetIfAddrs::test_ips" \
    --deselect "$relative_site_packages/psutil/tests/test_system.py::TestNetAPIs::test_net_if_addrs" \
    --deselect "$relative_site_packages/psutil/tests/test_system.py::TestSensorsAPIs::test_sensors_temperatures" \
    --ignore "$relative_site_packages/psutil/tests/test_memleaks.py"
}

package() {
  cd psutil-release-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
