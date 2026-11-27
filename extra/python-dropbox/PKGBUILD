# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Tim Diels <tim@timdiels.be>

pkgname=python-dropbox
pkgver=12.2.5
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
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  remove-version-constraints.patch
)
sha512sums=('6488db1299f992c0ee5cc5bdc02004c9bdc1d8fd6190481deea9a4f3585efd14fd2c3fd49e95a41b76aa1cdb459120e3811f5f9934049c3b2b716c9b296e1a34'
            'ccef00004aa32cece37f34dbd6ce08d64a97830554f658fb8a23b13b1302a4f0bf4384dcc358df8d965d3b5b6c9c5fd471d8095a6c33d04921237f58c942d5c4')
b2sums=('4d885e9be8f9b4719327400fe4e1b914184daf429dc5a19d2746742aeb545cab74b43ec0e83ce876e9f8cf783fda55f6c17622f47074c5ab5810e25a998e114a'
        '9a985cc67ebe366879544021c908b84342ee8e773abbf8547915396f35b8064b45b930d4685f62fc674be72a27882b7a64a180f68dacffd999fdbd7b039f9353')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/remove-version-constraints.patch"

  # Fix version
  sed -e "s|0.0.0|$pkgver|" -i dropbox/dropbox_client.py
}

build() {
  cd "$pkgname"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

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
