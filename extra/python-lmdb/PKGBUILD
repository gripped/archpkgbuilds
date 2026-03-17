# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>

_srcname=py-lmdb
pkgname=python-lmdb
pkgver=1.8.1
pkgrel=1
pkgdesc='Universal Python binding for the LMDB Lightning Database'
arch=('x86_64')
url='https://github.com/jnwatson/py-lmdb/'
license=('OLDAP-2.8')
depends=(
    'glibc'
    # tests fails with system lmdb, reporting that 'requires patched LMDB'
    #'lmdb'
    'python'
    'python-cffi')
makedepends=(
    'python-build'
    'python-installer'
    'python-patch-ng'
    'python-setuptools'
    'python-wheel')
checkdepends=(
    'python-pytest')
source=("https://github.com/jnwatson/py-lmdb/archive/${_srcname}_${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-python-lmdb-replace-pkg_resources-due-to-deprecation-in-setuptools-82.patch')
sha256sums=('fa608c66b138fb963b0ac460ef6511c4faa7045417b461dc37aa77d1c5739592'
            'f1e175793c7a020361a98acba9bc190ccf3dae8c9800c0d207e63a2419aa8e70')

prepare() {
    patch -d "${_srcname}-${_srcname}_${pkgver}" -Np1 -i "${srcdir}/010-python-lmdb-replace-pkg_resources-due-to-deprecation-in-setuptools-82.patch"
}

build() {
    cd "${_srcname}-${_srcname}_${pkgver}"
    
    #export LMDB_FORCE_SYSTEM='1'
    python -m build --wheel --no-isolation
}

check() {
    cd "${_srcname}-${_srcname}_${pkgver}"
    
    local _pyver
    _pyver="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
    
    #export LMDB_FORCE_SYSTEM='1'
    export PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${_pyver}"
    pytest -vv --color='yes'
}

package() {
    #export LMDB_FORCE_SYSTEM='1'
    python -m installer --destdir="$pkgdir" "${_srcname}-${_srcname}_${pkgver}/dist"/*.whl
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sr "${pkgdir}${_sitepkgs}/lmdb-${pkgver}.dist-info/licenses/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
