# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

pkgname=xonsh
pkgver=0.20.0
pkgrel=2
pkgdesc='A python-powered shell. Full-featured and cross-platform.'
url='https://xon.sh/'
arch=('any')
license=('BSD-2-Clause')
depends=(
    'python'
    'python-distro'
    'python-packaging'
    'python-ply'
    'python-pyperclip'
    'python-ujson')
optdepends=(
    'python-prompt_toolkit: for SHELL_TYPE=prompt_toolkit'
    'python-pygments: for syntax highlighting and colorization'
    'python-setproctitle: for updating process title to match Xonsh arguments')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    # for satisfying pkgcheck:
    'python-prompt_toolkit'
    'python-pygments'
    'python-setproctitle')
install=xonsh.install
source=("https://github.com/xonsh/xonsh/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f14a00345ed35a1f2103bc215f39e5f11721398213d88a5fad3e49c1fdf130c3')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "${pkgname}-${pkgver}/dist"/*.whl
    install -D -m644 "${pkgname}-${pkgver}/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
