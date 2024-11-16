# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-pytest-bdd
pkgver=8.0.0
pkgrel=1
pkgdesc='BDD library for the pytest runner'
arch=('any')
license=('MIT')
url='https://github.com/pytest-dev/pytest-bdd'
depends=(
  'python'
  'python-gherkin'
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
sha512sums=('39ebf30d41e00a27d943d232917fa0b8632445c28ca085f77f20aa730be4224164f29196b647bb9fc50760c0d1909251c84b4bbfbfe9f7efdf9a7e6d37b8caa5')

build() {
  cd pytest-bdd
  python -m build --wheel --no-isolation
}

check() {
  cd pytest-bdd
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
