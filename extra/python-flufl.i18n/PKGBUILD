# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl.i18n
pkgname=python-flufl.i18n
pkgver=6.0.0
pkgrel=2
pkgdesc="A high level API for internationalization"
arch=(any)
url="https://gitlab.com/warsaw/flufl.i18n"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-sybil
  python-pytest
)
provides=(python-flufl-i18n)
replaces=(python-flufl-i18n)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('978262651df715d6eeb46f1d7665bb9275a88dc38ad14f0b6b876969c1b1657b8f87f602b18373ccbcab110db4f03c7e54f5b8e5a7181a4bbddb37aba432818e')
b2sums=('5c76ec6b63fe7aed7a5fe3011151f0f12e8eb87fba506fd160a1f81835390559a67191329ce9f14efa33991dce2f842dddb1789600f1260d732b935d2979675b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -o addopts=''
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
