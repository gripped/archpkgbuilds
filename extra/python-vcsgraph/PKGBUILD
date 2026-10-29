# Maintainer: George Hu <integral@archlinux.org>

pkgname=python-vcsgraph
pkgver=0.3.3
pkgrel=1
pkgdesc="VCS graph operations"
arch=('x86_64')
url='https://github.com/breezy-team/vcsgraph'
license=('GPL-2.0-or-later')
depends=('glibc' 'libgcc' 'python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-rust')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('75f48853787b0d716a05dde6a8ece595e33c9fac701b7b9ccec260fd5f16e635')

prepare() {
	cd vcsgraph
	cargo fetch --locked
}

build() {
	cd vcsgraph
	python -m build --wheel --no-isolation
}

package() {
	cd vcsgraph
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
