# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2025.12.1.14
pkgrel=3
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-calver' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("git+https://github.com/pypa/trove-classifiers.git#tag=$pkgver")
sha512sums=('c476ab61588a27f4583ac9405128308500a46893d05e58096eafa35b0dd25f99f42aaf4de23887396eaa08cb93d4eb01ffa1339eb8c83166cf002de6ea2e62b4')

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
