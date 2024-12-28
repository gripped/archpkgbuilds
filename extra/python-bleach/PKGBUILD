# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-bleach
pkgver=6.2.0
pkgrel=2

pkgdesc="An easy whitelist-based HTML-sanitizing tool"
url="https://pypi.org/project/bleach/"
arch=('any')
license=('Apache-2.0')
depends=('python-packaging'
         'python-webencodings')
makedepends=('python'
             'python-setuptools')
checkdepends=('python-pytest')
optdepends=('python-tinycss2: for CSS sanitisation')

source=(https://pypi.org/packages/source/b/bleach/bleach-$pkgver.tar.gz)

sha256sums=('123e894118b8a599fd80d3ec1a6d4cc7ce4e5882b1317a7e1ba69b56e95f991f')

prepare() {
	cd "$srcdir"/bleach-$pkgver
}

build() {
	cd "$srcdir"/bleach-$pkgver
	python setup.py build
}

# Upstream broke the test suite.
check() {
	cd "$srcdir"/bleach-$pkgver
	python -m pytest
}

package() {
	cd "$srcdir"/bleach-$pkgver
	python setup.py install --skip-build --optimize=1 --root="$pkgdir"
}
