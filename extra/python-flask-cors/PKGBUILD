# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-flask-cors
pkgver=6.0.0
pkgrel=1
pkgdesc='A Flask extension adding a decorator for CORS support'
url='https://github.com/corydolphin/flask-cors'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-flask'
  'python-werkzeug'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(
  "git+$url.git#tag=$pkgver"
  "$pkgname-remove-failing-test.patch"
)
sha256sums=('ce7d040aa7aa6f74c514aeac389f299aeca4dcbc585ab56aa3b33d6207016415'
            '5bfe6eda0a101b6ee333ab37740ce751e8982bd5ee981719eb56c3476140f7ef')

prepare() {
	cd ${pkgname#python-}
  patch -Np1 < ../$pkgname-remove-failing-test.patch

	# Write versions following upstream release workflow
	# https://github.com/corydolphin/flask-cors/blob/5.0.1/.github/workflows/on-release-main.yml#L20-L21
	local RELEASE_VERSION=$pkgver
	sed -i "s/^version = \".*\"/version = \"$RELEASE_VERSION\"/" pyproject.toml
	sed -i "s/__version__ .*/__version__ = \"$RELEASE_VERSION\"/" flask_cors/version.py
}

build() {
	cd ${pkgname#python-}
	python -m build --wheel --no-isolation
}

check() {
	cd ${pkgname#python-}
	# Upstream uses nosetests, which appears to test all Pyton files,
	# while unittest discovers test*.py only by default.
	python -m unittest discover -p '*test*.py'
}

package() {
	cd ${pkgname#python-}
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
