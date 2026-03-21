# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=python-webtest
pkgver=3.0.5
pkgrel=1
pkgdesc="Helper to test WSGI applications"
arch=('any')
url='https://docs.pylonsproject.org/projects/webtest/en/latest/'
license=('MIT')
depends=('python-webob' 'python-beautifulsoup4' 'python-waitress')
optdepends=('python-pyquery: for response.pyquery'
            'python-lxml: for response.lxml')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pyquery' 'python-pastedeploy' 'python-wsgiproxy2')
source=("git+https://github.com/Pylons/webtest.git#tag=$pkgver")
sha512sums=('7fa8b3259f63ad6ab66945c8692edfa1a3129ecdd1036f1047bdf3e7db307dc5efdf80e09a9be1e3d65c0444e3459f47039da12a20d868fd1009f9efec69854d')

build() {
  cd webtest
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd webtest
  pytest
}

package() {
  cd webtest
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/WebTest-$pkgver.dist-info/LICENSE.rst \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
