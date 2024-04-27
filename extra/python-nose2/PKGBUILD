# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nose2
pkgname=python-nose2
pkgver=0.14.1
pkgrel=2
pkgdesc="The next generation of nicer testing for python"
arch=(any)
url="https://github.com/nose-devs/nose2"
license=(
  BSD-2-Clause
  BSD-3-Clause
)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-coverage
)
optdepends=(
  'python-coverage: for coverage_plugin'
  'python-setuptools: for eggdiscovery plugin'
  'python-sphinx: for doc'
  'python-sphinx_rtd_theme: for doc'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('7cd4e4a67dfd87ce85927aa65137ca7df926e8a4b83162131cb081cbec357e951693826d43f92beb92af0e1d690c8f0a3f8cf6b0b58f174ae2516383892b5207')
b2sums=('36a79f2a9afc288fd1025e8e1875dd15f145708ea4715c2db11f7a769c87c3209ad367d55b1634b1ff032bd65606ca74ed1d4424a4fba74dd44a377820ff8208')

prepare() {
  sed -n '1,27p' $_name-$pkgver/LICENSE > BSD-2-Clause.txt
  sed -n '34,65p' $_name-$pkgver/LICENSE > BSD-3-Clause.txt
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location to be able to run tests with nose2 itself
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  export PATH="$PWD/test_dir/usr/bin:$PATH"
  nose2 -v --start-dir test_dir/$site_packages/$_name/tests/unit
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 ../BSD-{2,3}-Clause.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {AUTHORS,README.rst} -t "$pkgdir/usr/share/doc/$pkgname/"
}
