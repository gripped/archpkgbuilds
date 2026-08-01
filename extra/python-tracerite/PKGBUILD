# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tracerite
pkgver=2.5.0
pkgrel=1
pkgdesc='Pythonic HTML generation/templating (no template files)'
arch=("any")
url='https://github.com/sanic-org/tracerite'
license=('Unlicense')
depends=(python python-html5tagger)
makedepends=(git python-build python-installer python-hatchling python-hatch-vcs)
source=("git+https://github.com/sanic-org/tracerite.git#tag=v$pkgver")
sha256sums=('4882a334fcc5676c2a339742db320de285b384bbfa1f37b9c0ce49aa483cf1a3')

build() {
    cd tracerite
    python -m build --wheel --no-isolation
}

package() {
    cd tracerite
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 docs/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
