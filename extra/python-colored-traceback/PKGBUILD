# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-colored-traceback
_name=colored-traceback
pkgver=0.4.2
pkgrel=1
pkgdesc='Automatically color Python’s uncaught exception tracebacks'
url='https://github.com/staticshock/colored-traceback.py'
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-colorama'
  'python-pygments'
)
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('f83dcc820051cb42801d4b3020b00d20f870e9229789993716b3d03b1e834ccfc7c48cfa112de0ad8eb30f167bcb9018476e715203c4ab1dd1d7e46a8f982921')
b2sums=('9a4e228b7291d4c74bc2cbee610ef750d3300fe9ee84cf2f6c668ebaf30f521eaae0ad67364936d1f537b66e30918ae729740dc604b8bd0829f9d383a847f511')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
