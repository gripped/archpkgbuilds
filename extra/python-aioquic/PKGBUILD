# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>

pkgname=python-aioquic
_name=aioquic
pkgver=1.4.0
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
sha256sums=('f8d4b1742a8ae6362ab037b34d5cbbdd3b5eafa9e186d3143e8f57d8d6ab5070')
b2sums=('59cc3db143b01e8c1b0eabc5c54d10d27d735debe642f87c485f10d3421d018af5b35856f6eca12f6a5675a37a6d08ed4076fca0be64884879906e90d2f1ab60')

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
