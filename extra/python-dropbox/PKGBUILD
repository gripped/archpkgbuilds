# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Tim Diels <tim@timdiels.be>

pkgname=python-dropbox
pkgver=12.2.2
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
sha512sums=('f13193b76e49c697ebbd302d102cfda354ec2acd061643353c09c78696cd333d3dc014d8741947ebd49c7074a9f9836b473530d55b33bf1d4c1228ffc298f037'
            '34538c6664424b4e5b2b73f202518db96dea67be8ac76db36dc2464d4f2e5d03dbc174d544993ebf3b093a05b7a8358155e3e0813393e138cc78d08c20759f82')
b2sums=('f40480b4411c62a703e05f183fe4796e0b3470c02d9a3f19e8e497fe8fbd0effba7a46c72fda1a8ef58d57f05ee6e720551098e7f095d32f15daab5be6b779c4'
        '522bae5dd90c4abf9fe18b8ab0069cc1707f8759c19fd5821bdb7b4275db7c7c32513cd6d2e9932976ec99302a091cf8b347c562ed5a978b695a71edc7d21daa')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/remove-version-constraints.patch"

  # don't use mock
  sed -e 's/import mock/from unittest import mock/' -i test/unit/test_dropbox_unit.py

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
