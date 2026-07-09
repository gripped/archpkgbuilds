# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-html5tagger
pkgver=1.4.0
pkgrel=1
pkgdesc='Pythonic HTML generation/templating (no template files)'
arch=("any")
url='https://github.com/sanic-org/html5tagger'
license=(Unlicense)
depends=(python)
makedepends=(git python-build python-hatchling python-hatch-vcs python-installer)
source=("git+https://github.com/sanic-org/html5tagger#tag=v$pkgver")
sha256sums=('57cd799c103f1d61ba1fd1ecafa596b0d26f8b930afc25786846212ae732dd3b')

build() {
    cd html5tagger
    python -m build --wheel --no-isolation
}

package() {
    cd html5tagger
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
