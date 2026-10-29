# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgname=python-pytest
_name=${pkgname#python-}
pkgver=9.2.0
pkgrel=1
epoch=1
pkgdesc='Simple powerful testing with Python'
arch=(any)
url=https://docs.pytest.org
license=(MIT)
depends=(
  python-iniconfig
  python-packaging
  python-pluggy
  python-pygments
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
  python-argcomplete
  python-attrs
  python-hypothesis
  python-requests
  python-xmlschema
  # Unlisted, but actually used. Check again after a while:
  lsof
  python-decorator
  python-docutils
  python-jinja
  python-numpy
  python-pexpect
  python-pytest-xdist
  python-twisted
)
source=("git+https://github.com/$_name-dev/$_name.git#tag=$pkgver")
b2sums=('d263e358cc0d9180510771990e7034b3ba1255147698b88f6ccfbe9d390d8ba5944426af6fdafabeebd8808a329ef52c45acf07fd50600ba34f4e4b3c5b94771')

build() {
  cd "$_name"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_name"
  PYTHONPATH="$PWD/src:$PYTHONPATH" pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/licenses/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
