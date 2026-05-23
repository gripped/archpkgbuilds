# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2026.5.20.19
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-calver' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("git+https://github.com/pypa/trove-classifiers.git#tag=$pkgver")
sha512sums=('7ec03b33df26157caabc38c5a0072c82491326a066922525c26bec90123bdc1094e413b2d07be8ed81d9af810c3fc78e4eb88205cdf6520582ee27422ddc1077')

prepare() {
  cd trove-classifiers
  # calver doesn't detect git tags
  echo "Version: $pkgver" > PKG-INFO
}

build() {
  cd trove-classifiers
  python -m build --wheel --no-isolation
}

check() {
  cd trove-classifiers
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m tests.lib
}

package() {
  cd trove-classifiers
  python -m installer --destdir="$pkgdir" dist/*.whl
}
