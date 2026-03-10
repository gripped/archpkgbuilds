# Maintainer: David Runge <dvzrv@archlinux.org>

_name=django-environ
pkgname=python-django-environ
pkgver=0.13.0
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
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz fix-postgres_cluster-test-fixture.patch)
sha512sums=('d83070008b0ed73e76edf5a091c73f214765026293c85a361d7dce2eee8170c9388bdef02ced6161798d2014c56d51a274d63feefa1e23a207dca16922ae0f27'
            '533356ebb382bf8e6d0a950a5e8879b48f2023d9a3a0950bd3195fa97025211846c82d1fe762802f7eab02e1a90d6dd3a8faea06e3ac96617fc2642885d4ab77')
b2sums=('e1076f88c740914d57ff636d5c484dd29aa606324372e48b1c141c67b1a990adcb877db52304839545998ffcb2615033a3b7d990f01c23a64fcbdc9b0088e7cb'
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
