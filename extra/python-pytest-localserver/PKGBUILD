# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-localserver
pkgver=0.9.0
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
sha512sums=('b4b860b2ba17e5a3c9e2aa515758c092891f65714caf3f7bd227a8178877801d0b2eb8df69ab3e2abb57928112662f8526405e4c089d6aef4e44fa8327245f45')

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
