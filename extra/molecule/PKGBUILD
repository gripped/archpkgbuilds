# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=molecule
pkgver=24.2.0
pkgrel=1
pkgdesc="Aids in the development and testing of Ansible roles"
arch=(any)
url="https://github.com/ansible-community/molecule"
license=(MIT)
depends=(
  python
  python-ansible-compat
  python-click
  python-click-help-colors
  python-cookiecutter
  python-enrich
  python-jinja
  python-jsonschema
  python-packaging
  python-pluggy
  python-pyyaml
  python-rich
  python-wcmatch
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  ansible
  check-jsonschema
  python-ansi2html
  python-filelock
  python-pexpect
  python-pytest
  python-pytest-mock
  python-pytest-testinfra
  python-pytest-xdist
  python-regress
  yamllint
)
optdepends=(
  'ansible: for the ansible verifier'
  'molecule-docker: for the docker driver'
  'molecule-podman: for the podman driver'
  'molecule-vagrant: for the vagrant driver'
  'python-pywinrm: for Windows support'
  'python-pytest-testinfra: for the testinfra verifier'
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('ead9ffcd1e93a07c9a0374bcd76c41a339037c4a5888cfdf469afff65ef28a39fcd66db1186c1525b6eecd7dee912ccd2c747e4d6aeef7967092daa7fe57bb2a')
b2sums=('3ba687f005f61633de84affda529b71c5964834e4aad7c55ff1f7e3f27312910f0ea4dab3885ac30206878918640c1463f7e0097f9f85da5496346bd81e884f0')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd $pkgname-$pkgver

  # install into test location
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  export PATH="test_dir/usr/bin:$PATH"
  pytest -v test/a_unit/ -c /dev/null
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
