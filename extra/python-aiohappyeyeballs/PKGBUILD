# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Łukasz Tuz <lukasz.tuz@gmail.com>

pkgname=python-aiohappyeyeballs
_name=${pkgname#python-}
pkgver=2.4.6
pkgrel=1
pkgdesc='Happy Eyeballs for asyncio'
arch=(any)
url=https://github.com/aio-libs/aiohappyeyeballs
license=(PSF-2.0.1)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-poetry-core
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
)
source=("git+$url.git#tag=v$pkgver")
b2sums=('4a108626002899f40186d486c0f40a8b531fe9a0d297999995bafb1a65bfe5c74f8c6ed78ff6fa34a542c76d49195af7c8c33ef873302779e2240fff7fbe0e1f')

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"
  # Override addopts as they invoke coverage testing
  pytest --override-ini="addopts=-v -Wdefault"
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
