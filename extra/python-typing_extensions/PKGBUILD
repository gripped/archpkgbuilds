# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Michael Yeatts <mwyeatts@gmail.com>

pkgname=python-typing_extensions
_name=${pkgname#python-}
pkgver=4.14.1
pkgrel=1
pkgdesc='Backported and Experimental Type Hints for Python 3.8+'
arch=(any)
url=https://github.com/python/typing_extensions
license=(Python-2.0.1)
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(python-tests)
source=("git+$url.git#tag=$pkgver")
b2sums=('0991c03e833292757947b7492f44f2ee2fa4a1fdfeaef386b7c4109d46491ee526d5c8389509ba498b7f460466f4af90b56dbc9fb9bd343ecd4a3ca3efc930ab')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  PYTHONPATH="$PWD/src" python -m unittest discover src
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages/$_name"-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
