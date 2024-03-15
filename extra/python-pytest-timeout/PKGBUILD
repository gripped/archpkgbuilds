# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-timeout
pkgver=2.3.0
pkgrel=1
pkgdesc='py.test plugin to abort hanging tests'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-timeout'
depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pexpect' 'python-pytest-cov')
source=("https://github.com/pytest-dev/pytest-timeout/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('be2f706bac5375f48c9fd92d420cccb118b0ea2aa9bbc6eb7bffef4af624d682de99b52dd106c1cbb8b5ecffcbf25ff4ab3c8e121e92d7f429e8784ed79b5aa0')

build() {
  cd pytest-timeout-$pkgver
  python -m build -nw
}

check() {
  # Hack entry points by installing it

  cd pytest-timeout-$pkgver
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer -d tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install$site_packages:$PYTHONPATH" pytest
}

package() {
  cd pytest-timeout-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
