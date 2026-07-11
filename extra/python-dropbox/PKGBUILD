# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Tim Diels <tim@timdiels.be>

pkgname=python-dropbox
pkgver=12.1.0
pkgrel=1
pkgdesc="Python SDK for Dropbox Core APIs"
url="https://github.com/dropbox/dropbox-sdk-python"
arch=(any)
license=(MIT)
depends=(
  python
  python-requests
  python-six
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
sha512sums=('44ad653f243e84da4fb547e4f3387b3a1a2fa760cc6fb15f3bfcaf09a696129cf7373e5abda12167a8018f68fb9ec2bc0c9b48ab5537ee2afb2f3b266e0cbd68')
b2sums=('a1ba96601f815347e10784bfacdf7b7be4f3082675bf74dd8ba9587728d78799feee781b52eb3c49b0abccb881d756be02e9b8851ec2f9957c76eccfbe3a5e4e')

prepare() {
  cd "$pkgname"

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
