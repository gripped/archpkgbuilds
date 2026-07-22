# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Tim Diels <tim@timdiels.be>

pkgname=python-dropbox
pkgver=12.2.1
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
sha512sums=('5b2cee4cad1793925ff27ae8b81160c4a44091fc2f7a0b86a71624f0080baba6740e00e1cd4d9d3132ca2f2f6b46f517c041bbb3d628e0076c487fb3e0c1445b'
            '9ce73f78183bc1817aab5fb97bb848a460f571d36cfe2611bc7363950ad1327c7eaf6abb563929222827a674168513387048e593a7fbe23038c96c6d6d25225b')
b2sums=('5f55d8e3229d3e9c4a36ff256adba65f0bb24a011bfe332401bc0f217e509bdcdd00a1fc6768be418d78b859dc3763c75dfbabb105b6e1e4620200263bba0ffb'
        '983543ce8a8d892dc236f60f74df7650758ad6127633a421acfa2a9a66e5bd8293d4925b5f7cea53421d0ff6e7ec9490534a6c41dab5c416b20b34a1ec9687c0')

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
