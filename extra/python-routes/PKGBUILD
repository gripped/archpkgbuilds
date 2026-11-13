# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: SpepS <dreamspepser@yahoo.it>
# Contributor: James Bulmer <nekinie@gmail.com>

pkgname=python-routes
pkgver=2.5.1
pkgrel=11
pkgdesc="Routing recognition and generation tools"
arch=("any")
url="https://pypi.python.org/pypi/Routes"
license=("MIT")
depends=('python-repoze.lru' 'python-six')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-webob' 'python-webtest')
source=("git+https://github.com/bbangert/routes.git#tag=v$pkgver")
sha512sums=('f94ed4fab70736a458e2e9df840054ef61a06c3528986d199c9c6c8265bbeeb403105954cafd6da7c1485b32b84d893757123a5c0ec0fe7fc14ec652c72a82c9')

prepare() {
  cd routes
  # Fix use of undefined variable
  git cherry-pick -n fd2c90b7547cfbc6adf985b2d98433138eed39a1
  # switch from nose to pytest
  git cherry-pick -n b182334575293c7603e0e90fac729a1b7215753c
}

build() {
  cd routes
  python -m build --wheel --no-isolation
}

check() {
  cd routes
  PYTHONPATH=. pytest
}

package() {
  cd routes
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
