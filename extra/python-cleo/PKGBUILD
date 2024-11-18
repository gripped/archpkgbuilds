# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=cleo
pkgname=python-cleo
pkgver=2.2.0.post1
pkgrel=1
pkgdesc="create beautiful and testable command-line interfaces"
arch=(any)
url="https://github.com/python-poetry/$_pkgname"
license=(MIT)
depends=(python-crashtest
         python-rapidfuzz
         python-typing_extensions)
makedepends=(python-{build,installer,wheel}
             python-poetry-core)
checkdepends=(python-pytest
              python-pytest-mock)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('a1f3eb5ed525db133393e4206317086767f967a6eaf3780d8e4531dc7d9163f9')
b2sums=('8fdb4175ee578b6d862e401815d807c2f167341bd778d248fa3eb4fb93c9a7da6b8c235f5d2ff4b03d0b938d07e323a1bf22fcf42711338f185cacb6df5ff708')

prepare() {
    cd "$_archive"
    # we do not use overly strict version constraints
    sed -e 's/\^/>=/g' \
        -e 's/~=/>=/g' \
        -i pyproject.toml
}

build(){
    cd "$_archive"
    python -m build -wn
}

check() {
    cd "$_archive"
    export PYTHONPATH="$PWD/src"
    pytest -vv
}

package() {
    cd "$_archive"
    python -m installer -d "$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
