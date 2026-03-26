# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-localserver
pkgver=0.9.0.post0
pkgrel=1
pkgdesc='py.test plugin to test server connections locally'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-localserver'
depends=('python-pytest' 'python-werkzeug')
optdepends=('python-aiosmtpd: for smtp')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'python-setuptools-scm')
checkdepends=('python-requests')
source=(git+https://github.com/pytest-dev/pytest-localserver.git#tag=v$pkgver)
sha512sums=('fcf4c2c2fab2fc6a7e51bb2a56b0b0fdeee39a184507536744a6fa521d92a8de7172191bcd94ddff7b288f015e6c131895afcd9271aa03ba705561dfe5f08c33')

build() {
  cd pytest-localserver
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-localserver
  python -m installer -d tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-localserver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
