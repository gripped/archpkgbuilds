# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: lilac <lilac@build.archlinuxcn.org>
# Contributor: Dimitris Kiziridis <ragouel@outlook.com>

_name=charset_normalizer
pkgname=python-charset-normalizer
pkgver=3.4.6
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
b2sums=('a5370b8afbc1d290c4b18d407557f8c4f536dc41b4106775b8a0ec376106a647ebbc3c590b32a9955ce255cbd85247038a906e197b1c3fe5f9673d04d0fe3fa4')

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
