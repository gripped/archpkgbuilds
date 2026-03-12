# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=python-webtest
pkgver=3.0.4
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
sha512sums=('a5edd9daae1a3995cd330e3c53ab338307aba6f2246db81fabd054b806ff2cf4bb68831e8ecd0080cbcec337963bad6b77b87b16eff8e6a8a7d9caf23b4a1347')

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
