# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Qirui Wang <wqr.prg@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=python-sanic
pkgver=25.12.0
pkgrel=1
pkgdesc='Async Python 3.10+ web server/framework | Build fast. Run fast.'
arch=("any")
url='https://sanic.dev/'
license=("MIT")
depends=('python-sanic-routing' 'python-httptools' 'python-uvloop' 'python-ujson' 'python-aiofiles'
         'python-websockets' 'python-multidict' 'python-tracerite' 'python-html5tagger'
         'python-typing_extensions')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/sanic-org/sanic.git#tag=v$pkgver")
sha256sums=('bc14f5b99a6b400012011b360ef1797d3758fdb04c4a96132f0227989eaa3e6a')

build() {
    cd sanic
    python -m build --wheel --no-isolation
}

# TODO: tests

package() {
    cd sanic
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
