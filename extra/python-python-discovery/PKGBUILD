# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-python-discovery
pkgver=1.6.0
pkgrel=1
pkgdesc='Python interpreter discovery'
arch=(any)
url='https://python-discovery.readthedocs.io'
license=(MIT)
depends=(
  python
  python-filelock
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-vcs
)
checkdepends=(
  python-pytest
  python-pytest-mock
  python-setuptools
)
source=(
  "$pkgname::git+https://github.com/tox-dev/python-discovery#tag=$pkgver"
  no-vermin.patch
)
sha512sums=('39d6b49f378400de24fe38d37ed62c05b2fd8d7a8f1c7ec1be48ad24e176641a1be4d53c9c0244d3917ee032fdfe6caadcc41177ac1008da3c3558acfa1eab86'
            'c9057e2e74dde6819b2f43cf6f29c6f0903da9f12784fc1e84fc24b972a8d114fb55c60630f65106cee1e2c02e043ddfff08f5729c98d3e35a32c0b83ec184cd')
b2sums=('9dc5ae04dbd479bde6af680f7e7c312fbbfddb81f8faae9e25fd8c3dad941f58a61c3212cbe0ddb1174ff7641d779ea55a5d74eb00dea6eeea0a56c1159f4ac0'
        'e23fac44ff0fe6dc0eb4f19da9bef5410c0e4d03b2992d2f79eba45a4b69c81173c11feb13e84d8d440938b67aa65f3ada6fe6583f627f828a83fa70863ec507')

prepare() {
  cd "$pkgname"

  # we don't want to detect old python versions
  patch -p1 -i "$srcdir/no-vermin.patch"
}

build() {
  cd "$pkgname"

  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
