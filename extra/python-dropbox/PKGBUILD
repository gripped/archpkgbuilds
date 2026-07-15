# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Tim Diels <tim@timdiels.be>

pkgname=python-dropbox
pkgver=12.2.0
pkgrel=1
pkgdesc="Python SDK for Dropbox Core APIs"
url="https://github.com/dropbox/dropbox-sdk-python"
arch=(any)
license=(MIT)
depends=(
  python
  python-requests
  python-stone
  python-urllib3
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-ply
  python-pytest
  python-pytest-mock
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('53d4469f90473b079e0d8043dd4b98321fbe157e858cf74eb08da4aa6047f961d6292c3a72298d79de0828d8a10c4031b411a1b23ea47bac42777da513c3d73f')
b2sums=('b8c5420771dc407fb60182c0632cc3ee952432136ef648e7d7dc9a2d2c37b08cfd651202fe438821ac047b92cc674e6976757af29987a7b13e7a2f0faba70463')

prepare() {
  cd "$pkgname"

  # don't use mock
  sed -e 's/import mock/from unittest import mock/' -i test/unit/test_dropbox_unit.py

  # Fix version
  sed -e "s|0.0.0|$pkgver|" -i dropbox/dropbox_client.py
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # temporary install
  python -m installer --destdir="$(pwd)/tmp" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$(pwd)/tmp/$site_packages"

  pytest -vv --ignore test/integration/
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
