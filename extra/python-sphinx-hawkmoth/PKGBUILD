# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

pkgname=python-sphinx-hawkmoth
pkgver=0.18.0
pkgrel=2
pkgdesc="Sphinx autodoc C extension"
url="https://github.com/jnikula/hawkmoth"
arch=(x86_64)
license=(BSD-2-Clause)
depends=(
  clang
  python
  python-docutils
  python-sphinx
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-xdist
  python-strictyaml
)
source=("git+https://github.com/jnikula/hawkmoth?signed#tag=v$pkgver")
b2sums=('c591d3739c8232afd2ea005e80cd7b888dc66f623c4961f09b535e91d2025635fcc45a5a5a3fcea48527106cc7721b27436992ae92e32a944e88225e1299854d')
validpgpkeys=(
  3FE6F7606966ED87707760B6A14C59DFEDB4CE88 # Jani Nikula <jani@nikula.org>
)

build() {
  cd hawkmoth
  python -m build --wheel --no-isolation
}

check() {
  cd hawkmoth
  PYTHONPATH="$PWD/src" make test
}

package() {
  cd hawkmoth
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:
