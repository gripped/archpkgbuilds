# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-engineio
pkgver=4.8.2
pkgrel=2
pkgdesc='Python implementation of the Engine.IO realtime server'
url='https://github.com/miguelgrinberg/python-engineio'
arch=('any')
license=('MIT')
depends=('python' 'python-websocket-client' 'python-websockets' 'python-requests')
optdepends=('python-eventlet: eventlet driver'
            'python-aiohttp: aiohttp driver'
            'python-tornado: tornado driver'
            'python-gevent: gevent driver'
            'python-gevent-websocket: gevent driver')
makedepends=('python-setuptools' 'python-sphinx' 'python-six' 'python-eventlet' 'python-aiohttp' 'python-tornado'
             'python-urllib3' 'python-gevent' 'python-gevent-websocket'
             'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
options=('!makeflags')
source=(https://github.com/miguelgrinberg/python-engineio/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ad61794f4ebabdaca86e049f378818506f6d2dc0bc52a4a7687185c2ef11788652d55e397a7e45f666f8c4233e46be5b16b7fda38440e96d0a66116e9327c172')
b2sums=('a985466a661c1ad1995999c1792758bc6a412097911f64cbb8a38af362b19f5a2abd7aa0fb1e6806310f766db0fc4486ae2793ad4fc8804fe580540daff73a3a')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
  PYTHONPATH="$PWD/src" make -C docs man text SPHINXBUILD=sphinx-build
}

check() {
  cd ${pkgname}-${pkgver}
  PYTHONPATH=build/lib pytest -v
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/python-engineio.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
