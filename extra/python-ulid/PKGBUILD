# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-ulid
pkgver=2.4.0.post0
pkgrel=2
pkgdesc="ULID implementation for Python"
arch=(any)
url="https://github.com/mdomke/python-ulid"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-hatch-fancy-pypi-readme
  python-hatch-vcs
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-freezegun
  python-pydantic
  python-pytest
)
optdepends=('python-pydantic: for pydantic integration')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('b936d775cdde7b17bcdc2e1b2565132e9a025083ea0e13f595860054ac6bb05d6066756e6b500c1a60c2842f9147b2c812a1487e22463d8f249578a0a6e8e6c1')
b2sums=('27bf9b6b871c4a268854dc5e3918b355fe05ae45a24aaaebe74e33b5f051f3cd377b8289e188e49885c295be058912e89d57f8b2bcc67aa89c563b3b0d34c8c9')

build() {
  cd $pkgname-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $pkgname-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
