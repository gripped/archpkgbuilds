# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=sphinxcontrib_htmlhelp
pkgname=python-sphinxcontrib-htmlhelp
pkgver=2.0.3
pkgrel=1
pkgdesc='Sphinx extension which renders HTML help files'
arch=('any')
url=https://github.com/sphinx-doc/sphinxcontrib-htmlhelp
license=('BSD')
makedepends=('python-build' 'python-flit-core' 'python-installer')
checkdepends=('python-html5lib' 'python-pytest' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('14358d0f88ccf58447f2b54343cdcc0012f32de2f8d27cf934fdbc0b362f9597')
b2sums=('c21a6b046aff388a05e8a2a3b926f1b5e3e4b280ce0f504cd799efe72470d9602ab67bca3ed7d45ad94bda395682cdc3e501a29602d70ff58e22e897155872ea')

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
