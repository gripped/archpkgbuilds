# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Tim Diels <tim@timdiels.be>

_name=dropbox-sdk-python
pkgname=python-dropbox
pkgver=12.0.0
pkgrel=1
pkgdesc="Python SDK for Dropbox Core APIs"
url="https://github.com/dropbox/dropbox-sdk-python"
arch=(any)
license=(MIT)
depends=(
  python
  python-requests
  python-setuptools  # for dropbox.session
  python-six
  python-stone
  python-urllib3
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-ply
  python-pytest
  python-pytest-mock
)
source=($url/archive/v$pkgver/$_name-v$pkgver.tar.gz)
sha512sums=('5cf28c0e338a3399e4448c64fde823bfc872a6a6a93dc25241c96f55c21abe194b9e882d32d098f4c329941f36d0dec79786e521f2686c7d4c0eeb64bd745f21')
b2sums=('dc75c8c0be5d8c44820cddf8e39b8e86180fc8ddc482ef4656ad5525e268f6f13fa1529138290205acd0a946b6d8d90a3df48aff9fb14f410d5c2c409ee399c3')

prepare() {
  cd $_name-$pkgver
  # remove strict version dependencies
  # remove broken version specifiers
  sed -e 's/==/>=/;s/2\.\*/2.0/' -i setup.py requirements.txt test/requirements.txt
  # don't use mock
  sed -e 's/import mock/from unittest import mock/' -i test/unit/test_dropbox_unit.py
  # Fix version
  sed -e "s|0.0.0|$pkgver|" -i dropbox/dropbox_client.py
  # Remove pytest-runner
  sed -i 's|pytest-runner|pytest|' setup.py requirements.txt
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv --ignore test/integration/
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
