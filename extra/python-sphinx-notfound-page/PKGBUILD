# Maintainer: 

pkgname=python-sphinx-notfound-page
_pyname=${pkgname/python-/}
pkgver=1.0.4
pkgrel=1
pkgdesc='Create a custom 404 page with absolute URLs hardcoded'
url='https://github.com/readthedocs/sphinx-notfound-page'
arch=(any)
license=(MIT)
depends=(python
         python-docutils
         python-sphinx)
makedepends=(git
             python-build
             python-flit-core
             python-installer)
checkdepends=(python-pytest)
source=(git+https://github.com/readthedocs/sphinx-notfound-page#tag=$pkgver)
sha512sums=('48931e50d9f73d690f9ddd01a546de9ddd87e6ffe924e5c4cd739f577c548c377940269d21bf1cdb4669ae0c332f23f3b669d8ca11525626c5c78850b4c03399')

prepare() {
  cd $_pyname
  git cherry-pick -n 8af414e0f76dddd64143090a7eb9ff9d3f1de2d1 # Fix tests
}

build() {
  cd $_pyname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pyname
  python -m installer --destdir=tmp-install dist/*.whl
  PYTHONPATH="$PWD"/tmp-install`python -c "import site; print(site.getsitepackages()[0])"` \
  pytest -v
}

package() {
  cd $_pyname
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
