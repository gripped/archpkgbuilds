# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-ulid
pkgver=3.1.0
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
sha512sums=('3dc614681b06a8e4f6bed28442806e8a728ffa6ccae6f42b9555bf15d84a61d50ef305cf8d09fcbb9d6a1eb672604db0478f60c2df7055598dfb735d797700e1')
b2sums=('25189f057898a535f0d134ceb377e36816d7a0f238c1e0b683742b039cde20e59dfca2a6dfe67a4104e2d77817c352b69b597b2fee183414b9aaee0d68248cf6')

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
