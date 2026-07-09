# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=molecule
pkgver=26.6.0
pkgrel=1
pkgdesc="Aids in the development and testing of Ansible roles"
url="https://github.com/ansible-community/molecule"
arch=('any')
license=('MIT')
depends=('python' 'python-ansible-compat' 'python-click' 'python-click-help-colors' 'python-enrich' 'python-jinja' 'python-jsonschema' 'python-packaging' 'python-pluggy' 'python-yaml' 'python-rich' 'python-wcmatch')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel' 'git')
checkdepends=('ansible' 'ansible-navigator' 'check-jsonschema' 'python-ansi2html' 'python-filelock' 'python-pexpect' 'python-pytest' 'python-pytest-mock' 'python-pytest-testinfra' 'python-pytest-xdist' 'python-regress' 'python-uv' 'yamllint')
optdepends=('ansible: for the ansible verifier'
            'ansible-navigator: to use navigator as playbook executor'
            'python-pywinrm: for Windows support'
            'python-pytest-testinfra: for the testinfra verifier')
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('b48c63fa885b820ca40ee7076962fdd754c34d69e0c5883c5cfaf8cdf8af2255074f40573f2d36095dbd35806ee46115cf9be00157e6d1e1e620e1ac3090b8ff')
b2sums=('c6cf1a1b11ff65d70ca5d52ebbf3c78da718b086a497c1f97998e382faa2382dfd0a1e0de503a5ddc598ebb30cf1b7b2a46bca2f90b54fe07fb2fbcad5711b74')

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
