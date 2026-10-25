# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

pkgname=python-xxhash
pkgver=4.0.2
pkgrel=1
pkgdesc='Python binding for xxHash'
arch=(x86_64)
url="https://github.com/ifduyue/$pkgname"
license=(BSD-2-Clause)
depends=(
    glibc
    python
    xxhash
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
source=("$pkgname::git+$url.git#tag=v$pkgver"
        test_interpreters.patch)
b2sums=('9d4c75c5c140c97e9b5978db8c901237d3ff99336ab1b3ed68be43cb66e0b599386bce21f4b50a010a9a603d19e78f5f1ca72903046a250679a41371b8e1e3a2'
        'e0f340fc85ab1726f7b8fca1473dfc2cf576574d90799db7e4f20010df1d24c4d17e47b7dedaf79a3aa5f9ba52f4acebd06cd0755934c1acc1ead5bc55ba459e')

prepare() {
    # benchmark imports pytest, all other tests rely on the unittest module
    rm $pkgname/tests/test_benchmark.py
    # we are not testing typing annotations
    rm $pkgname/tests/test_stubs_pyright.py

    # avoid messing with sys.path in tests (breaks importing xxhash installed in test-env)
    cd $pkgname
    patch -p1 < ../test_interpreters.patch
}

build() {
    cd $pkgname
    # link to xxHash
    XXHASH_LINK_SO=1 \
    python -m build --wheel --no-isolation
}

check() {
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer $pkgname/dist/*.whl
    test-env/bin/python -m unittest discover -vs $pkgname/tests
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
