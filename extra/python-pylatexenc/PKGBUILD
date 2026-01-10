# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Asger Hautop Drewsen <asger@tyilo.com>

pkgname=python-pylatexenc
_pkgname=${pkgname#python-}
pkgver=2.10
pkgrel=6
pkgdesc="Simple LaTeX parser providing latex-to-unicode and unicode-to-latex conversion"
arch=(any)
url="https://github.com/phfaist/pylatexenc"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bcb859affea00b5acb25aec780620170ab9d385c8f7dc266b7237ce9f47a59fd')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
