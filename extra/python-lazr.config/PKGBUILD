# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-lazr.config
_name="${pkgname#python-}"
pkgver=3.1
pkgrel=3
pkgdesc="Create configuration schemas, and process and validate configurations"
arch=(any)
url="https://launchpad.net/lazr.config"
license=(LGPL-3.0-only)
depends=(
  python
  python-lazr.delegates
  python-setuptools  # pkg_resources is used to declare namespaces
  python-zope-interface
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  python-zope-testrunner
)
provides=(python-lazr-config)
replaces=(python-lazr-config)
source=(git+https://git.launchpad.net/lazr.config#tag=$pkgver)
sha512sums=('ee5e10ac0be62bedfd69d01dfa364b0eb75e6ad7d291d096d13d15b902cac33310d5a8c1812656b04edcb3f5489e164fa0cbac1cf42aa00ab85b69762ccc85eb')
b2sums=('2b49fadf20e0066e2a25a783b60f25e59730e00411c1f25f3d7596a0061664b44b90fb6dd8aeaaf77809fece70ee7f34f2207d3255c0c521b5be60f0c44a685a')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  python -m zope.testrunner --test-path src --tests-pattern ^tests
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {NEWS,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  rm -frv "$pkgdir/$site_packages/lazr/config/tests"
}
