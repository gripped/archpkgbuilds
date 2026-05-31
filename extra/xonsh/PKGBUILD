# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=xonsh
pkgver=0.23.8
pkgrel=1
pkgdesc='A python-powered shell. Full-featured and cross-platform.'
url='https://xon.sh/'
arch=('any')
license=('BSD-2-Clause')
depends=(
    'python'
    'python-click'
    'python-distro'
    'python-packaging'
    'python-ply'
    'python-ujson')
optdepends=(
    'python-prompt_toolkit: for SHELL_TYPE=prompt_toolkit'
    'python-pygments: for syntax highlighting and colorization'
    'python-setproctitle: for updating process title to match Xonsh arguments'
    'python-wcwidth: for unicode symbols and emoji completer')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    # for satisfying namcap:
    'python-prompt_toolkit'
    'python-pygments'
    'python-setproctitle'
    'python-wcwidth')
install=xonsh.install
source=("https://github.com/xonsh/xonsh/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3482272f0a27d08f9381169bcd7b4945783b855751c7053cd534d54c7fe84081')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "${pkgname}-${pkgver}/dist"/*.whl
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
