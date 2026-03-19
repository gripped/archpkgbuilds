# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-msgspec
pkgver=0.20.0
pkgrel=1
pkgdesc='A fast serialization and validation library, with builtin support for JSON, MessagePack, YAML, and TOML'
arch=(x86_64)
url=https://github.com/jcrist/msgspec
license=(BSD-3-Clause)
depends=(
  glibc
  python
  python-attrs
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-msgpack
  python-pytest
)
optdepends=(
  'python-tomli-w: for TOML writing support'
  'python-yaml: for YAML support'
)
source=("$pkgname::git+$url.git#tag=$pkgver")
b2sums=('d91ac507e40a7055c0ded9cc3825220aaa7273dccc91f25386b9a740779296f9352ad8fca8debce2f8c2a0b88ef778c2cc7ad4324e52e6fea90e67a14a78c710')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests/unit
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
