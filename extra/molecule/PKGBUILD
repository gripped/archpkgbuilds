# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=molecule
pkgver=25.9.0
pkgrel=1
pkgdesc="Aids in the development and testing of Ansible roles"
url="https://github.com/ansible-community/molecule"
arch=('any')
license=('MIT')
depends=('python' 'python-ansible-compat' 'python-click' 'python-click-help-colors' 'python-enrich' 'python-jinja' 'python-jsonschema' 'python-packaging' 'python-pluggy' 'python-pyyaml' 'python-rich' 'python-wcmatch')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'git')
checkdepends=('ansible' 'ansible-navigator' 'check-jsonschema' 'python-ansi2html' 'python-filelock' 'python-pexpect' 'python-pytest' 'python-pytest-mock' 'python-pytest-testinfra' 'python-pytest-xdist' 'python-regress' 'python-uv' 'yamllint')
optdepends=('ansible: for the ansible verifier'
            'ansible-navigator: to use navigator as playbook executor'
            'molecule-docker: for the docker driver'
            'molecule-podman: for the podman driver'
            'molecule-vagrant: for the vagrant driver'
            'python-pywinrm: for Windows support'
            'python-pytest-testinfra: for the testinfra verifier')
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('b89fb5f2c2578d27795ab89004e2b9e1dbc42022b553c6a36e34a548d6d39186dbba26232627ce59fede464c64593b3733b0109eb0a91d3303617bb61c8bf7dd')
b2sums=('58d1dcdda7918e5d2a9f47b2eec9cfe8d1b90073f2f2890166734d98450687814edce5bc4e71667dc8deaa21eac7c41d9398f81bcdbccfdf8f97f1f61007f80e')

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
	pytest --deselect 'tests/unit/test_config.py::test_validate' -v tests/unit/ -c /dev/null --rootdir=.
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
