# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Otreblan <otreblain@gmail.com>

pkgname=python-pygls
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc='Pythonic generic implementation of the Language Server Protocol'
arch=(any)
url=https://github.com/openlawlibrary/pygls
license=(Apache-2.0)
depends=(
  python-attrs
  python-cattrs
  python-lsprotocol
)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
checkdepends=(python-pytest-asyncio)
source=("git+$url.git#tag=v$pkgver")
b2sums=('43eeb437259783cfbfa13ca39dd2e8daee5e630555ea3bc2d7cb0023b5eaa4209c67cd9d52450fcfd9f0ff22d277dac07548030a46dcfccb2ecfe736432824a4')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  PYTHONPATH="$PWD/$_name:$PYTHONPATH" pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/licenses/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
