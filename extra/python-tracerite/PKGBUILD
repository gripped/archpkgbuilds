# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tracerite
pkgver=2.5.1
pkgrel=1
pkgdesc='Pythonic HTML generation/templating (no template files)'
arch=("any")
url='https://github.com/sanic-org/tracerite'
license=('Unlicense')
depends=(python python-html5tagger)
makedepends=(git python-build python-installer python-hatchling python-hatch-vcs)
source=("git+https://github.com/sanic-org/tracerite.git#tag=v$pkgver")
sha256sums=('b8bdcc4fb7b2e7e4c12843db1f1e0b67c0e7c3295c5a891153cda8f2f0a6f264')

build() {
    cd tracerite
    python -m build --wheel --no-isolation
}

package() {
    cd tracerite
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 docs/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
