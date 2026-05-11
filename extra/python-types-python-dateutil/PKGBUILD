# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Achmad Fathoni <fathoni.id(at)gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

_name=types_python_dateutil
pkgname=python-${_name//_/-}
pkgver=2.9.0.20260508
pkgrel=1
pkgdesc="Typing stubs for python-dateutil"
arch=(any)
url="https://pypi.org/project/types-python-dateutil/"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('a46afbb5e7889e389b5b3a6af75696245cf35b1dd2db97437edc0a51fc5fb2077fde65be7ab8a403e94cbca8440fc2c0f7723bc1b12aeb9fe9de63217125f264')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
