# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-python-discovery
pkgver=1.5.3
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
sha512sums=('1da8e51cb707de2fca41c41fa9a301d4f3973bd4c7c516b83c7a019e1af4fec3805d1d743425d1d07ffb7bfc18abe434f5bce4fb295f4d462c5fbfbeed82889e'
            'c9057e2e74dde6819b2f43cf6f29c6f0903da9f12784fc1e84fc24b972a8d114fb55c60630f65106cee1e2c02e043ddfff08f5729c98d3e35a32c0b83ec184cd')
b2sums=('6b565c7c080bb0f5bb148d12642d3c7c42bd57b3181ca14d714bc88fc4effffbd732d349142d7241dffc00a0b18af1ee15d9ffaa1d61f2fb6603c48149a070d2'
        'e23fac44ff0fe6dc0eb4f19da9bef5410c0e4d03b2992d2f79eba45a4b69c81173c11feb13e84d8d440938b67aa65f3ada6fe6583f627f828a83fa70863ec507')

prepare() {
  cd "$pkgname"

  # we don't want to detect old python versions
  patch -p1 -i "$srcdir/no-vermin.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
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
