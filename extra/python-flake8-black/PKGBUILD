# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-flake8-black
pkgver=3.0.7
pkgrel=1
pkgdesc='Flake8 plugin to call black as a code style validator'
arch=(any)
url=https://github.com/peterjc/flake8-black
license=(MIT)
depends=(
  python
  flake8
  python-black
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
)
source=(
  "$pkgname::git+$url.git#tag=v$pkgver"
  pyproject-no-pip.patch
)
sha512sums=('9dbfabbfe469b39c0987ad88390f1c2f36786f648e6f6f193ce6cc343d6ae7e435f41abbdf8cd22ea8fdb872eb9f9284326e36cd3ed8e843ba069b320e1b9203'
            '0dc458646781a621b571ac6a2ef892da242fa353b0be3e63a189ff0da8d0d10495521ff559072e50ada62e3565e43103cf605766b4cdf9f1b97a039a1ebd03fd')
b2sums=('cc9d53f5674960084a0d616f2c9d6fef71570d954f07da957e38f8ce42c216b829f07961dfdb7a85b5f899f3bab9baedec26422cdea5e53355f98ce55943f53d'
        'abc8840cf1cbf6b2386c38e690dcb479671cf2df64c584787f7ebb06c31dc3cec1d1d407e3bf3173460f31f8a61023bd1609e20fcac9317f67a3c18c610b2b19')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/pyproject-no-pip.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

# Requires black==23.9.1 for tests
# https://github.com/peterjc/flake8-black/commit/8abe1ae59ee2b37b5c790152a7c7ba44118ebb8e
#check() {
#  cd "$pkgname"
#
#  python -m venv --system-site-packages test-env
#  source test-env/bin/activate
#  python -m installer dist/*.whl
#  cd tests
#  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
#  PYTHONPATH="../build:$site_packages" ./run_tests.sh
#  deactivate
#}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.rst
}
