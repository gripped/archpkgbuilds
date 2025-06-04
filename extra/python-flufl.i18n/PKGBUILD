# Maintainer: David Runge <dvzrv@archlinux.org>

_name=flufl.i18n
pkgname=python-flufl.i18n
pkgver=5.2.0
pkgrel=1
pkgdesc="A high level API for internationalization"
arch=(any)
url="https://gitlab.com/warsaw/flufl.i18n"
license=(Apache-2.0)
depends=(
  python
  python-atpublic
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-sybil
  python-pytest
)
provides=(python-flufl-i18n)
replaces=(python-flufl-i18n)
source=($url/-/archive/$pkgver/$_name-$pkgver.tar.gz)
sha512sums=('e4582b426a06c974fc24bd8f1439695d132330e28b8b76c0aaaac95588189f7714a5e647c235a8977fdcf17ce2b98e742f7a85cee03227efb6b111f0b3de7d7c')
b2sums=('5a6a08d4acce376eb93c7a78b16ee7c3acd55c68756ae6c4604939c06ff63de37c1f65f833d772041c002e3ab09b95f729df80c61e956ab875de3eed896e4de6')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest -vv -o addopts=''
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
