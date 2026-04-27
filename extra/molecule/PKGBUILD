# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=molecule
pkgver=26.4.0
pkgrel=2
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
sha512sums=('42ac06d56c3ff43525758fe5bb532918bbc5a4c61467b46bee5546d9ad9856551777e274ff0cde17326d613058915eee3352b8e42317ff0c53724f96770be8a4')
b2sums=('3fb3b04d428feaa3d48c45dddd0f2820ef6d0ea921ae972b5ad02002ac8630cf8a821178b8de60d593de94512cc3db5abe1dcec8e5893df3237f05d1b974e1e0')

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
