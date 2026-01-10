# Maintainer: Bert Peters <bertptrs@archlinux.org>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-mysqlclient
_libname=${pkgname/python-/}
pkgver=2.2.7
pkgrel=3
pkgdesc="Fork of MySQL-python with support for Python 3"
arch=('x86_64')
url="https://github.com/PyMySQL/mysqlclient-python"
license=('GPL-2.0-or-later')
depends=('python' 'mariadb-libs')
makedepends=('mariadb' 'python-setuptools' 'python-installer' 'python-wheel' 'python-build')
source=("https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz")

build() {
    cd "$srcdir"/$_libname-$pkgver
    python -m build --wheel --no-isolation
}

# No check(); this requires spinning up a database service in the background

package() {
    cd "$srcdir"/$_libname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('24ae22b59416d5fcce7e99c9d37548350b4565baac82f95e149cac6ce4163845')
