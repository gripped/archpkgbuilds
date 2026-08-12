# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tracerite
pkgver=2.6.1
pkgrel=1
pkgdesc='Pythonic HTML generation/templating (no template files)'
arch=("any")
url='https://github.com/sanic-org/tracerite'
license=('Unlicense')
depends=(python python-html5tagger)
makedepends=(git python-build python-installer python-hatchling python-hatch-vcs)
source=("git+https://github.com/sanic-org/tracerite.git#tag=v$pkgver")
sha256sums=('50d82960e60aecad3eec918cedf686443d9df39c98e154a72ed1ba608b075b2a')

build() {
    cd tracerite
    python -m build --wheel --no-isolation
}

package() {
    cd tracerite
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 docs/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
