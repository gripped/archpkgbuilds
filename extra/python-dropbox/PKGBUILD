# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Tim Diels <tim@timdiels.be>

pkgname=python-dropbox
pkgver=12.0.2
pkgrel=4
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
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  remove-pkg_resources.patch
)
sha512sums=('2438cbc4d38fe4a1fa465e406c1aaecb09ddb4a29cb49dece84666827d0be1e95978a6292811b9e804683ff4fd1b9014e0a683072a55922d11d722d08cd6ee20'
            'd1ef3a20600fe898644e54a400bda29b5da636f479c396cc5e7f3085f13e7c5973c35ff5f9756e05a3b78b8bd11eac263ca7eef1f8b25cfefdab2444ef0abb5c')
b2sums=('7c70156098696bb670205ec2a9233eaa2f62e8b92fdd8176151d02e286985bf5501968a2c2e4a12cb4c2ffdf76ada521ff8a7a962fb4c2b8928242436702fb34'
        'fa69818f568afa8f54cb5bdd84353cd045447b2777ea6d320be53847053e3b4b9b4e7c0ed4a4f7294d9fcfa7199778640ca6ae203c91ab40b4f48a2f7c3d2880')

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

  # remove pkg_resources
  patch -p1 -i "$srcdir/remove-pkg_resources.patch"
  rm -rf ez_setup.py
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
