# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-dbusmock
pkgver=0.37.0
pkgrel=1
pkgdesc="Mock D-Bus objects for tests"
url="https://github.com/martinpitt/python-dbusmock"
arch=(any)
license=(LGPL-3.0-or-later)
depends=(
  glib2
  python
  python-dbus
  python-gobject
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
source=("git+https://github.com/martinpitt/python-dbusmock#tag=$pkgver")
b2sums=('c656b8ca177493aff9cf16d6ce265590539945f82fd37ecefa21267ff1457ad55778e2b7c0bc48fd89f4f67dc54878a0e6915424073a24ea2ddf542be6c1b0e4')
validpgpkeys=(
  3DB46B55EFA59D40E6232148D14EF15DAFE11347 # Martin Pitt <martin@piware.de>
)

prepare() {
  cd $pkgname
}

build() {
  # Suppress local version
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver%%+*}"

  python -m build --wheel --no-isolation $pkgname
}

package() {
  python -m installer --destdir="$pkgdir" $pkgname/dist/*.whl
}

# vim:set sw=2 sts=-1 et:
