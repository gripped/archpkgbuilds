# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-testtools
pkgver=2.8.3
pkgrel=2
pkgdesc="Extensions to the Python standard library unit testing framework"
arch=('any')
license=('MIT')
url="https://github.com/testing-cabal/testtools"
depends=('python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-testscenarios' 'python-testresources' 'python-fixtures' 'python-twisted')
source=("git+https://github.com/testing-cabal/testtools.git#tag=$pkgver")
sha512sums=('5f6329ecdac027955a2aa13c07f0a2a63c338ab1bd3f68e497a99a3d76ede0761a8ebdd26ac31556482292d101b6ddf8ca910c3a8a9fc80756b7a58035203f3c')

prepare() {
  cd testtools
  # Fix iterate_tests to handle non-TestSuite iterables like lists
  git cherry-pick -n badf51609d13885274e56f30281bd96dc926d788
}

build() {
  cd testtools
  python -m build -nw
}

check() {
  cd testtools
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m testtools.run tests.test_suite
}

package() {
  cd testtools
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
