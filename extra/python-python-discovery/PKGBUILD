# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-python-discovery
pkgver=1.9.3
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
  python-hatch-fancy-pypi-readme
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
sha512sums=('e30b57c17dffe1a0abc3827c0983b85c076d383ccc4a49d8a9461bdb27f2955c70e412447d4c9b22e1a4c63d2aa6307fd965aa366d7d126e8a18ba806ea2ad14'
            'c9057e2e74dde6819b2f43cf6f29c6f0903da9f12784fc1e84fc24b972a8d114fb55c60630f65106cee1e2c02e043ddfff08f5729c98d3e35a32c0b83ec184cd')
b2sums=('039a39d21ae50e6726aaf1eb49f803c5a7ac121f9c41c1a807c439fed84e76def12ac4de11f8d9d7403d6a4e9fea6ab3d8270ccbc59911a6fda502bdacc9473e'
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
