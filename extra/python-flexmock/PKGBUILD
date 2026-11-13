# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-flexmock
pkgver=0.14.0
pkgrel=1
pkgdesc="Mock/Stub/Spy library for Python"
arch=('any')
url="https://flexmock.readthedocs.io"
license=('BSD-2-Clause')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-teamcity-messages' 'python-testtools' 'python-twisted')
source=("git+https://github.com/flexmock/flexmock.git#tag=v$pkgver")
sha512sums=('bf46439c0679dfc8ce27c4a86385e3aada849f2ed99b39ea08a8021988fd00667887e05e6c0c241f23153ca336ba4c55e0eee58c27482a7fbd50d91f685e4f3d')

build() {
  cd flexmock
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd flexmock
  PYTHONPATH="$PWD/src" pytest -p flexmock._pytest_plugin
}

package() {
  cd flexmock
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/flexmock-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
