# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jeffrey Zhang <zhang.lei.fly#gmail.com>

pkgname=ansible-runner
pkgver=2.4.1
pkgrel=2
pkgdesc="A tool and python library that helps when interfacing with Ansible"
url="https://github.com/ansible/ansible-runner"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-daemon' 'python-pexpect' 'python-psutil' 'python-six' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        'relax_setuptools_upperbound_version.patch')
sha256sums=('8bceb472241a48f66bec47c126d27f4580297653f928db8763129e6c8c2c9696'
            '10993cd0f35a1edb949358942158546aae4fb7ec135cc67013007d1c474f024f')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/relax_setuptools_upperbound_version.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
