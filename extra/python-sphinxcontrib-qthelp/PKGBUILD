# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib_qthelp
pkgname=python-sphinxcontrib-qthelp
pkgver=1.0.5
pkgrel=1
pkgdesc='Sphinx extension which outputs QtHelp document'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-qthelp
license=('BSD')
makedepends=('python-build' 'python-flit-core' 'python-installer')
checkdepends=('python-pytest' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d31d1a1beaf3894866bb318fb712f1edc82687f1c06235a01e5b2c50c36d5c40')
b2sums=('fb72e9a1149a021a2ed73fb67380c7a715d687742f7713d1471c7b372848f85f1c075a4f2a16683d1e738e885d680a77b506100eb3a687e370b460c52ed82402')

build() {
  cd $_name-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
