# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Raphaël Doursenaud <rdoursenaud at free dot fr>

pkgname=python-mysql-connector
_pkgname=mysql-connector-python
pkgver=9.5.0
pkgrel=2
pkgdesc="A standardized database driver for Python platforms and development"
arch=('any')
url="https://dev.mysql.com/downloads/connector/python/"
license=('GPL-2.0-only')
depends=('python' 'python-dnspython' 'python-typing_extensions')
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://cdn.mysql.com//Downloads/Connector-Python/${_pkgname}-${pkgver}-src.tar.gz"
		 "${_pkgname}-${pkgver}-src.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=${_pkgname}-${pkgver}-src.tar.gz&p=29")
sha512sums=('718f0799fd552e439652ed918b1d9f91e261107afdbaa69dc79364a67a72de886b673e9edf431aaac4ce5be42f5bc052979bc28c91c6ec4b352ebe61a748850c'
            'SKIP')
validpgpkeys=('859BE8D7C586F538430B19C2467B942D3A79BD29'
              'BCA43417C3B485DD128EC6D4B7B3B788A8D3785C')  # MySQL Release Engineering <mysql-build@oss.oracle.com>

build() {
	cd "${_pkgname}-${pkgver}-src"
	python -m build --wheel --no-isolation mysql-connector-python/
	python -m build --wheel --no-isolation mysqlx-connector-python/
}

package() {
	cd "${_pkgname}-${pkgver}-src"
	python -m installer --destdir="$pkgdir" mysql-connector-python/dist/*.whl
	python -m installer --destdir="$pkgdir" mysqlx-connector-python/dist/*.whl
}
