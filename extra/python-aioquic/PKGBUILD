# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-aioquic
_name=aioquic
pkgver=1.3.0
pkgrel=1
pkgdesc='QUIC and HTTP/3 implementation in Python'
url='https://github.com/aiortc/aioquic'
arch=('x86_64')
license=('BSD-3-Clause')
depends=(
  'glibc'
  'openssl'
  'python'
  'python-certifi'
  'python-cryptography'
  'python-pylsqpack'
  'python-pyopenssl'
  'python-service-identity'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('28d070b2183e3e79afa9d4e7bd558960d0d53aeb98bc0cf0a358b279ba797c92')
b2sums=('cc15af13fc83510f041b8be53b8a19f6f9f95dfa0374d2cee8194350b72a160f1d885ae1ea4846fc46ea5b6cb6d3ec09315a130e4226db9d466e3f7b71650baf')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd ${_name}-${pkgver}
  python -m installer --destdir=test_dir dist/*.whl

  PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH" python -c '
import aioquic
import aioquic.h3.connection
import aioquic.quic.packet
'
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
