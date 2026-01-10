# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-txredisapi
pkgver=1.4.11
pkgrel=2

pkgdesc='Non-blocking redis client for python'
url='https://pypi.python.org/pypi/txredisapi/'
arch=('any')
license=('Apache')

depends=('python' 'python-twisted' 'python-six')
makedepends=('python-setuptools')

source=("https://pypi.org/packages/source/t/txredisapi/txredisapi-$pkgver.tar.gz")

sha256sums=('3eb1af99aefdefb59eb877b1dd08861efad60915e30ad5bf3d5bf6c5cedcdbc6')

build() {
	cd "$srcdir"/txredisapi-$pkgver
	python setup.py build
}

package() {
	cd txredisapi-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 tw=0 ft=PKGBUILD :
