# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tracerite
pkgver=2.6.2
pkgrel=1
pkgdesc='Pythonic HTML generation/templating (no template files)'
arch=("any")
url='https://github.com/sanic-org/tracerite'
license=('Unlicense')
depends=(python python-html5tagger)
makedepends=(git python-build python-installer python-hatchling python-hatch-vcs)
source=("git+https://github.com/sanic-org/tracerite.git#tag=v$pkgver")
sha256sums=('becb8bcd84fc45a50a1a56a2424c209cd4d7d863b31a975e7df9254e882d8900')

build() {
    cd tracerite
    python -m build --wheel --no-isolation
}

package() {
    cd tracerite
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 docs/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
