# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=molecule
pkgver=25.3.1
pkgrel=1
pkgdesc="Aids in the development and testing of Ansible roles"
url="https://github.com/ansible-community/molecule"
arch=('any')
license=('MIT')
depends=('python' 'python-ansible-compat' 'python-click' 'python-click-help-colors' 'python-enrich' 'python-jinja' 'python-jsonschema' 'python-packaging' 'python-pluggy' 'python-pyyaml' 'python-rich' 'python-wcmatch')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'git')
checkdepends=('ansible' 'check-jsonschema' 'python-ansi2html' 'python-filelock' 'python-pexpect' 'python-pytest' 'python-pytest-mock' 'python-pytest-testinfra' 'python-pytest-xdist' 'python-regress' 'python-uv' 'yamllint')
optdepends=('ansible: for the ansible verifier'
            'molecule-docker: for the docker driver'
	    'molecule-podman: for the podman driver'
	    'molecule-vagrant: for the vagrant driver'
	    'python-pywinrm: for Windows support'
	    'python-pytest-testinfra: for the testinfra verifier')
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('69363516708d599489e3f53e48a50a2d0b8cb74ed4be6e6cdedd8b615a5045151342950f460ed14ca350d2245b81d88c7feae5e8d8460e58fbcb3b3145d5b436')
b2sums=('c1594c1383d3998b9dd533b380aa04b7282cd53a6e3ed6955cd34226eb3fda22a83cbcdb6a2f1ec3df019eec3cae5a78bf862e6ae84fb97b2843f78380ee708d')

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
