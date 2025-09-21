# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Alexander Jacocks <alexander@redhat.com>

pkgname=ansible-creator
pkgver=25.9.0
pkgrel=1
pkgdesc="A CLI tool for scaffolding all your Ansible Content"
arch=('any')
url="https://github.com/ansible/ansible-creator"
license=('Apache-2.0')
depends=('python' 'python-jsonschema' 'python-onigurumacffi' 'ansible-core' 'ansible-runner')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
optdepends=('ansible: check official ansible collections'
            'docker: To use docker as a container runtime'
            'podman: To use podman as a container runtime')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a48383a8ab72b2f773df3d6cd8451238a2d9603e81f6de649a3b17ffb8dc05bf')

build() {
	cd "${pkgname}-${pkgver}"
	export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	cp -av src/ansible_creator/resources/{common,execution_env_project,playbook_project} "${pkgdir}/${site_packages}/ansible_creator/resources/"
}
