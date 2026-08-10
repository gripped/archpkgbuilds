# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tracerite
pkgver=2.6.0
pkgrel=1
pkgdesc='Pythonic HTML generation/templating (no template files)'
arch=("any")
url='https://github.com/sanic-org/tracerite'
license=('Unlicense')
depends=(python python-html5tagger)
makedepends=(git python-build python-installer python-hatchling python-hatch-vcs)
source=("git+https://github.com/sanic-org/tracerite.git#tag=v$pkgver")
sha256sums=('8c15d2b1f7d2a9fe956486c13c445cb26c4a79a6a954d6dacddfd42c9985be56')

build() {
    cd tracerite
    python -m build --wheel --no-isolation
}

package() {
    cd tracerite
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 docs/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
