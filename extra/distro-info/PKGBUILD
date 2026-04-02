# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Johannes Dewender   arch at JonnyJD dot net

pkgname=distro-info
pkgver=1.12
pkgrel=1
pkgdesc="Information about all releases of Debian and Ubuntu"
arch=('x86_64')
url="https://salsa.debian.org/debian/distro-info"
license=('ISC')
depends=('distro-info-data' 'glibc' 'python')
makedepends=(
  'git'
  'dpkg'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'flake8'
  'python-black'
  'python-isort'
  'python-pylint'
  'shunit2'
)
provides=('python-distro-info' 'perl-distro-info')
conflicts=('python-distro-info' 'perl-distro-info')
options=('!emptydirs')
source=("git+https://salsa.debian.org/debian/distro-info.git#tag=debian/$pkgver")
sha256sums=('b04497b6667a8ed1b6b71456a35f8121af73abdca9e112bdef77cb8c8e2a338c')

prepare() {
  cd $pkgname
  sed -i \
    -e 's/^\(CFLAGS = .*\)/\1 '"${CFLAGS}/" \
    -e 's/^\(CPPFLAGS = .*\)/\1 '"${CPPFLAGS}/" \
    -e 's/^\(LDFLAGS = .*\)/\1 '"${LDFLAGS}/" \
    -e '/python3 setup.py install/d' \
    Makefile
}

build() {
  cd $pkgname
  make
  cd python
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  make test-commandline
  make test-perl
  cd python
  python -m unittest
}

package() {
  cd $pkgname
  # vendor can currently be only ubuntu or debian
  # with ubuntu you can build for PPA (with bzr-builddeb)
  make DESTDIR="$pkgdir" VENDOR="ubuntu" install
  python -I -m installer --destdir="${pkgdir}" python/dist/*.whl
  install -Dm644 debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
