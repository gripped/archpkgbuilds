# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Hyacinthe Cartiaux <hyacinthe@archlinux.org>

pkgname=mkdocs-autorefs
_pkgname=autorefs
pkgver=1.4.5
pkgrel=1
pkgdesc="Automatically link across pages in MkDocs"
arch=(any)
url="https://github.com/mkdocstrings/autorefs"
license=(ISC)
depends=(
  mkdocs
  python
  python-jinja
  python-markdown
  python-markupsafe
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  mkdocs-material
  python-pygments
  python-pymdown-extensions
  python-pytest
)
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('7f08521663dcc88b5dedf9c092c62431b9bae956b18ebc5f28582f06275684dc06f84f739592bc5d055655854cd3b108a462daa5ae39a64284e3b4e631410c95')

build() {
  cd $_pkgname-$pkgver
  export PDM_BUILD_SCM_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # tests/test_api.py requires griffe, which is not in repos
  test-env/bin/python -m pytest \
    --ignore tests/test_api.py
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
