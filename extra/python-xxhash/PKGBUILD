# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgname=python-xxhash
pkgver=3.7.0
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
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('e96b8db35efe2e17468140d0058fbcd7bc845cc25e9c6b133eae8b3f347b99fa0aefe929fceeb5ec94a814374095ad8f481b876dca9721d69ab71d0e77419fab')

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
