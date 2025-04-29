# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

_name=setuptools_scm
pkgname=python-setuptools-scm
pkgver=8.3.0
pkgrel=1
pkgdesc="Handles managing your python package versions in scm metadata"
arch=('any')
url="https://github.com/pypa/setuptools_scm"
license=('MIT')
depends=('python-packaging' 'python-setuptools')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('mercurial' 'python-pip' 'python-pytest' 'python-rich')
source=("git+$url.git#tag=v$pkgver")
b2sums=('5903f3ac6e6f06a0f4359d5d99236cdadfa1465fda28ff9d001a42198302c56bd5d5bf24e74169390e68b1d5cbbddaf01f25683a7aa3063aa009614244f69c33')

build() {
  cd $_name
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vk 'not test_not_owner'
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
