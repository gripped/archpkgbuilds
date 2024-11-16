# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Lance Chen <cyen0312@gmail.com>

_pypiname=wheel
pkgname=python-wheel
pkgver=0.45.0
pkgrel=1
pkgdesc="A built-package format for Python"
arch=(any)
url="https://pypi.python.org/pypi/wheel"
license=('MIT')
depends=('python' 'python-packaging')
optdepends=('python-keyring: for wheel.signatures'
            'python-xdg: for wheel.signatures'
            'python-setuptools: for legacy bdist_wheel subcommand')
makedepends=('python-build' 'python-flit-core' 'python-installer')
checkdepends=('python-jsonschema' 'python-pytest' 'python-keyring' 'python-keyrings-alt'
              'python-xdg' 'python-setuptools')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/pypa/wheel/archive/$pkgver.tar.gz"
  $pkgname-0.45.0-devendor.patch
)
sha512sums=('b5610405ae6aa387d4597821793e82115873137bd24d9e07f4b68680089e93f595ecdf42c8e290b2daaca2b9687afe02a0255baf32d1ee60870b1e9f0a9dd644'
            'b9e705f1ca4f71332cd20b404d3eaae13a0785958a021078d786177b161e789c370d20dd0411246e53890235d8dc527c72a4cc8023c0bcff8921135422b98173')

prepare() {
  cd wheel-$pkgver
  # remove vendored python-packaging
  patch -Np1 -d . -i ../$pkgname-0.45.0-devendor.patch
  rm -rv src/wheel/vendored
}

build() {
  cd wheel-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # Hack entry points by installing it

  cd wheel-$pkgver
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
  cd wheel-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
