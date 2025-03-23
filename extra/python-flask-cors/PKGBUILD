# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-flask-cors
pkgver=5.0.1
pkgrel=1

pkgdesc='A Flask extension adding a decorator for CORS support'
url='https://github.com/corydolphin/flask-cors'
arch=('any')
license=('MIT')

depends=('python' 'python-flask' 'python-werkzeug')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("git+https://github.com/corydolphin/flask-cors.git#tag=$pkgver")

sha256sums=('bd14700e139f4f636975f0de14ef0ed3c0064a1e92d04d124a365ff41dc2a97a')

prepare() {
	cd flask-cors

	# Write versions following upstream release workflow
	# https://github.com/corydolphin/flask-cors/blob/5.0.1/.github/workflows/on-release-main.yml#L20-L21
	local RELEASE_VERSION=$pkgver
	sed -i "s/^version = \".*\"/version = \"$RELEASE_VERSION\"/" pyproject.toml
	sed -i "s/__version__ .*/__version__ = \"$RELEASE_VERSION\"/" flask_cors/version.py
}

build() {
	cd flask-cors
	python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
	cd flask-cors
	# Upstream uses nosetests, which appears to test all Pyton files,
	# while unittest discovers test*.py only by default.
	python -m unittest discover -p '*test*.py'
}

package() {
	cd flask-cors
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
