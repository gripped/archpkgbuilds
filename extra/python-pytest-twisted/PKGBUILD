# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-twisted
pkgver=1.14.2
pkgrel=1
pkgdesc='A twisted plugin for py.test'
arch=('any')
license=('BSD')
url='https://github.com/pytest-dev/pytest-twisted'
depends=('python-pytest' 'python-greenlet' 'python-decorator' 'python-twisted')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/pytest-dev/pytest-twisted.git#tag=v$pkgver")
sha512sums=('d653dbb131fc904ff1e76580731fc43672a60a0e1ee461638975bacc6227d74b00d2897be44c3659aef2e65c6d398e044bff4cfdeaf032fde82166fcc2637572')

build() {
  cd pytest-twisted
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-twisted
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/${site_packages}:$PYTHONPATH" py.test
}

package() {
  cd pytest-twisted
  python setup.py install --root="$pkgdir" --optimize=1
}
