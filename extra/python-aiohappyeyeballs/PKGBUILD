# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Łukasz Tuz <lukasz.tuz@gmail.com>

pkgname=python-aiohappyeyeballs
_name=${pkgname#python-}
pkgver=2.3.6
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
b2sums=('e2da21fe75057a590a4424a7b7b6aa0f70b640255e1b67c1e7a38b8718ed6f749561bb1848b077ea9f652c6a973f98e8332829d8513dd345019d15ce922561bb')

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
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
