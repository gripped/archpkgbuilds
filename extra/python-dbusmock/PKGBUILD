# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=python-dbusmock
pkgver=0.32.2
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
b2sums=('32a1886f563b977d46e6cc890b26e740e1d9cdc7a069b9cbad5b10a1baa8d1baa7027503fca00042a7383be05d4bdb44dadc530b10efeadaf843ba8f3a2c8244')
validpgpkeys=(
  3DB46B55EFA59D40E6232148D14EF15DAFE11347 # Martin Pitt <martin@piware.de>
)

prepare() {
  cd $pkgname
}

build() {
  cd $pkgname

  # Suppress local version
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver%%+*}"

  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set sw=2 sts=-1 et:
