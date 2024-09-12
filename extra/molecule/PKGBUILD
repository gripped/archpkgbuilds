# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=molecule
pkgver=24.9.0
pkgrel=1
pkgdesc="Aids in the development and testing of Ansible roles"
url="https://github.com/ansible-community/molecule"
arch=('any')
license=('MIT')
depends=('python' 'python-ansible-compat' 'python-click' 'python-click-help-colors' 'python-enrich' 'python-jinja' 'python-jsonschema' 'python-packaging' 'python-pluggy' 'python-pyyaml' 'python-rich' 'python-wcmatch')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'git')
checkdepends=('ansible' 'check-jsonschema' 'python-ansi2html' 'python-filelock' 'python-pexpect' 'python-pytest' 'python-pytest-mock' 'python-pytest-testinfra' 'python-pytest-xdist' 'python-regress' 'yamllint')
optdepends=('ansible: for the ansible verifier'
            'molecule-docker: for the docker driver'
	    'molecule-podman: for the podman driver'
	    'molecule-vagrant: for the vagrant driver'
	    'python-pywinrm: for Windows support'
	    'python-pytest-testinfra: for the testinfra verifier')
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('47266650de7dc749a7129a9ba72c902acc5e390e7ad6bc4597a28946be5315b1dbe9637f92e151f0225e196e8c5a38cdfb86b8f0326c4a0fd884ad62c54c4b55')
b2sums=('4cab8edad8be52b456c875ff5e969fe19534d55443304a37aa0b6e937ea9de6ebac8a8eedd4751f6d85c83cc99c2b6799bd34745fa35091cf6707b18801b464b')

build() {
	cd "${pkgname}"
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	cd "${pkgname}"
	
	# install into test location
	python -m installer --destdir=test_dir dist/*.whl
	export PYTHONPATH="test_dir/${site_packages}:${PYTHONPATH}"
	export PATH="test_dir/usr/bin:${PATH}"
	pytest -v tests/unit/ -c /dev/null
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
