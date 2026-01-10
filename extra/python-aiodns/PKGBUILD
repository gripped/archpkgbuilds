# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-aiodns
_name=${pkgname#python-}
pkgver=3.6.1
pkgrel=3
pkgdesc='Simple DNS resolver for asyncio'
arch=(any)
url=https://github.com/saghul/aiodns
license=(MIT)
depends=(python-pycares)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-uvloop
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('e27bca08a4b96bdaf62dc2545296bd88cd2996e01fc08b1b655bde2ba5be7983490cd9746192628fe55c485aa800721d0dc3363f384e12e67bf7844ddebda9d6')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  # Override addopts as they invoke coverage testing
  PYTHONPATH=aiodns:$PYTHONPATH pytest --override-ini="addopts=" -v -k 'not test_gethostbyaddr'
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
