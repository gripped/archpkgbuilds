# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-environ
pkgname=python-django-environ
pkgver=0.12.0
pkgrel=2
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
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz fix-postgres_cluster-test-fixture.patch)
sha512sums=('299ded59546847e0bfac25dea3c8967685d6e1f35b4aabe27cc7ae7104430bda1b989fd286915428e1dd1c429fd8ed156faaecfc41a2df0d2293d7cd75f9adb8'
            '533356ebb382bf8e6d0a950a5e8879b48f2023d9a3a0950bd3195fa97025211846c82d1fe762802f7eab02e1a90d6dd3a8faea06e3ac96617fc2642885d4ab77')
b2sums=('4c930d3ac66bbf9bd629ceee10c0fbeb78073c26e49c910a6300e481488562de97b9074b3da74aa27500b330eb391399922a19edd42aa40f09c8b2b107b0f5e2'
        'a76541343a474509fe466dc55038d6dc2e4ace22c60ae59338c005ffe84ad15f32b4638ec2d886bbd5e5460f441e50e57d4fb605ddce0884147d893cabc8b9fe')

prepare() {
  cd $_name-$pkgver
  patch -Np1 -i ${srcdir}/fix-postgres_cluster-test-fixture.patch
}

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
