# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-hiredis
_pkgname=hiredis-py
pkgver=3.1.1
pkgrel=1
pkgdesc='Non-blocking redis client for python'
arch=('x86_64')
url='https://pypi.org/project/hiredis/'
license=('MIT')
depends=(
    'glibc'
    'python'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-pytest')
source=(
    "git+https://github.com/redis/hiredis-py.git#tag=v$pkgver"
    "git+https://github.com/redis/hiredis.git"
)
sha256sums=('5f4023546e08cedf497cea5cb438dad629a7accd9400b7d009927a0d02f329db'
            'SKIP')

prepare() {
    cd $_pkgname
    git submodule init
    git config submodule.vendor/hiredis.url "$srcdir/hiredis"
    git -c protocol.file.allow=always submodule update
}

build() {
	cd $_pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    python -m installer --destdir=tmp_install dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$PWD/tmp_install/$site_packages" pytest
}

package() {
	cd $_pkgname
    python -m installer -d "$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
