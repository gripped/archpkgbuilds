# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Bogdan Burlacu <bogdan.burlacu AT pm.me>

pkgname=onetbb
pkgver=2023.0.0
pkgrel=1
pkgdesc='oneAPI Threading Building Blocks - a high level abstract threading library'
arch=('x86_64')
url='https://uxlfoundation.github.io/oneTBB/'
license=('Apache-2.0')
depends=(
    'glibc'
    'hwloc'
    'libgcc'
    'libstdc++')
optdepends=(
    'python: for Python module')
makedepends=(
    'cmake'
    'python'
    'python-pip'
    'python-setuptools'
    'swig')
conflicts=('intel-tbb' 'tbb')
provides=("intel-tbb=${pkgver}" "tbb=${pkgver}")
replaces=('intel-tbb' 'tbb')
source=("https://github.com/uxlfoundation/oneTBB/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-onetbb-fix-linkage-of-test-malloc-pure-c.patch')
sha512sums=('7db4a41e3b0e34a559299451f7eef633190e7e4be1819f609f773ac6b7f3d31ff5e45f3cfabd3606e280adb930d47a77a31377e5ef72c85dcb37a354d8b87e55'
            '358f2753df4a4d94246941d9f13b84eae7b290520a20757a527cb7edd78fc68836a8141af0f6dc1b713f037002452ef788231ddc29ab914fd36ba270fd1fcec0')

prepare() {
    # https://github.com/uxlfoundation/oneTBB/issues/1735
    # https://gitlab.archlinux.org/archlinux/packaging/packages/onetbb/-/merge_requests/2
    patch -d "oneTBB-${pkgver}" -Np1 -i "${srcdir}/010-onetbb-fix-linkage-of-test-malloc-pure-c.patch"
}

build() {
    cmake -B build -S "oneTBB-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DTBB_STRICT:BOOL='OFF' \
        -DTBB4PY_BUILD:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure -E test_partitioner # hangs on build server
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
