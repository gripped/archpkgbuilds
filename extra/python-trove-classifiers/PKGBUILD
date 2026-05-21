# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-trove-classifiers
pkgver=2026.5.20.13
pkgrel=1
pkgdesc="Canonical source for classifiers on PyPI (pypi.org)"
url="https://github.com/pypa/trove-classifiers"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('git' 'python-calver' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("git+https://github.com/pypa/trove-classifiers.git#tag=$pkgver")
sha512sums=('73fb97370b31f7fc461f59068968368e97279dbddb680084d565a6f180b80468b3f2ac368306e2fea79ef07b53f54cbb5913c36717ac3f9277c5c0febf09699b')

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
