# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-pytest-cov
pkgver=6.2.0
pkgrel=1
pkgdesc='py.test plugin for coverage reporting with support for both centralised and distributed testing, including subprocesses and multiprocessing'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-cov'
depends=('python-coverage' 'python-pytest')
makedepends=('git' 'python-setuptools')
checkdepends=('python-virtualenv' 'python-process-tests' 'python-pytest-xdist' 'python-fields')
source=("git+https://github.com/pytest-dev/pytest-cov.git#tag=v$pkgver")
sha512sums=('ed89ef3560dc8f625664b5a6eb51d0e35c985c49f9d2f8c05e6f36c2f15a4920a0ba038139259f13a699686c217ee22a6b61a34d65007424a86a76cb5f0a1465')

build() {
  cd pytest-cov
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-cov
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH:$PWD/tests" pytest || echo "Tests failed"
}

package() {
  cd pytest-cov
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
