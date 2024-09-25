# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pytest-bdd
pkgver=7.3.0
pkgrel=1
pkgdesc='BDD library for the pytest runner'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-bdd'
depends=(
  'python'
  'python-mako'
  'python-packaging'
  'python-parse'
  'python-parse-type'
  'python-pluggy'
  'python-pytest'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=('python-setuptools')
source=("git+$url.git#tag=$pkgver")
sha512sums=('d253556e6e823287d6e229ed677c0a366e044ea46e0b9e8c29448797e6da10c8f7820d4eee4cbd798db88017db305f4a2b9a60c534eb439917ef502ffbaac116')

build() {
  cd pytest-bdd
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-bdd
  # Hack entry points by installing it
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PATH="$PWD/tmp_install/usr/bin:$PATH" PYTHONPATH="$PWD/tmp_install/$site_packages" \
    pytest --override-ini=addopts=
}

package() {
  cd pytest-bdd
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

# vim:set ts=2 sw=2 et:
