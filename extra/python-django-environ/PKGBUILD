# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-environ
pkgname=python-django-environ
pkgver=0.12.0
pkgrel=1
pkgdesc="Utilize 12factor inspired environment variables to configure your Django application"
arch=(any)
url="https://github.com/joke2k/django-environ"
license=(MIT)
depends=(
  python
  python-django
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
optdepends=('python-simplejson: for an alternative JSON implementation')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('299ded59546847e0bfac25dea3c8967685d6e1f35b4aabe27cc7ae7104430bda1b989fd286915428e1dd1c429fd8ed156faaecfc41a2df0d2293d7cd75f9adb8')
b2sums=('4c930d3ac66bbf9bd629ceee10c0fbeb78073c26e49c910a6300e481488562de97b9074b3da74aa27500b330eb391399922a19edd42aa40f09c8b2b107b0f5e2')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {AUTHORS,CHANGELOG,README}.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
