# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: JP Cimalando <jp-dev@inbox.ru>

pkgname=hy
epoch=1
pkgver=1.2.0
pkgrel=1
pkgdesc="A dialect of Lisp that's embedded in Python"
arch=('any')
url="http://hylang.org/"
license=('MIT')
depends=('python-funcparserlib')
makedepends=('python-setuptools' 'python-build' 'python-wheel' 'python-installer')
checkdepends=('python-pytest' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hylang/hy/archive/$pkgver.tar.gz")
sha256sums=('4671522acec3c067e6f9dfd7083a156e9754fd43528fad6789b948b75d16b7e1')

prepare() {
    cd "$pkgname-$pkgver"

    # usually generated from git metadata and aded to PyPI sdist
    # PyPI does not include testsuite files.
    echo "__version__ = '$pkgver'" > hy/version.py
}

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"

    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    export PATH="$PATH:$PWD/test-env/bin" PYTHONPATH="$PWD"
    test-env/bin/python -m pytest -v -k 'not test_correct_logic and not test_compact_logic'
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf "$pkgdir/usr/get_version"
}
