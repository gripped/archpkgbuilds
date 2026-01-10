# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jeffrey Zhang <zhang.lei.fly#gmail.com>

pkgname=ansible-runner
pkgver=2.4.2
pkgrel=3
pkgdesc="A tool and python library that helps when interfacing with Ansible"
url="https://github.com/ansible/ansible-runner"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-daemon' 'python-pexpect' 'python-yaml')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        'relax_setuptools_upperbound_version.patch')
sha256sums=('07398551890d0829f37f4c72af78f747bf887b8ea07efd94e2b8bcc0c26e6875'
            'cb6af5b6b3a302b003be8267f4cfcc23b07e8b803273627b89c3a2f36e8ea914')

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
