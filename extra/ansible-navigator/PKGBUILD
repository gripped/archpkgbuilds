# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander Jacocks <alexander@redhat.com>

pkgname=ansible-navigator
pkgver=26.1.1
pkgrel=1
pkgdesc="A text-based user interface (TUI) for Ansible"
url="https://github.com/ansible/ansible-navigator"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-jsonschema' 'python-onigurumacffi' 'ansible-core' 'ansible-runner')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
optdepends=('ansible: check official ansible collections'
            'docker: To use docker as a container runtime'
            'podman: To use podman as a container runtime')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('317b40ed4ea7908b85a7c2699f36964802e54eb288409667ca0dabab6df7e69a')

build() {
	cd "${pkgname}-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
