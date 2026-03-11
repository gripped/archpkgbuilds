# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: lilac <lilac@build.archlinuxcn.org>
# Contributor: Dimitris Kiziridis <ragouel@outlook.com>

_name=charset_normalizer
pkgname=python-charset-normalizer
pkgver=3.4.5
pkgrel=1
pkgdesc='Encoding and language detection alternative to chardet'
arch=(x86_64)
url=https://github.com/Ousret/charset_normalizer
license=(MIT)
depends=(python)
makedepends=(
  git
  mypy
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("git+$url.git#tag=$pkgver")
b2sums=('e37fa4c06ccebf40a30841b8d3aec4e4c5a0503c53701444e7046f35f5b9a65b990a6b9254bb866a93ad06a94e59753e3317b7f18cf344848ff680305eaa7020')

build() {
  cd $_name
  export CHARSET_NORMALIZER_USE_MYPYC=1
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name
  PYTHONPATH=src pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
