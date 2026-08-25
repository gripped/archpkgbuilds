# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-pbr
pkgver=7.1.1
pkgrel=1
pkgdesc="Python Build Reasonableness"
arch=('any')
url='https://pypi.python.org/pypi/pbr'
license=('Apache-2.0')
depends=('python-setuptools')
makedepends=('git' 'python-build' 'python-installer')
checkdepends=('python-stestr' 'python-testresources' 'python-testscenarios'
              'python-testtools' 'python-virtualenv' 'python-sphinx' 'python-testrepository')
source=("git+https://github.com/openstack-dev/pbr.git#tag=$pkgver")
sha512sums=('299916f9d2cbfc26f5b0a2d8e7c4c9c420f12a1a6b60324f31ada09046779981a50b030f3d168c02c394edf9f07b01c63afde63926347c5482c780b6d9f1ee45')

build() {
  cd pbr
  python -m build --wheel --no-isolation
}

check() {
  cd pbr
  # HACK: work around error: could not lock config file /dev/null: Permission denied
  export GIT_CONFIG_GLOBAL="$HOME/.gitconfig"
  python -m venv --system-site-packages --without-pip "$srcdir/check-venv"
  "$srcdir/check-venv/bin/python" -m installer dist/*.whl
  # Exclude tests that require networking
  PATH="$srcdir/check-venv/bin:$PATH" "$srcdir/check-venv/bin/python" -m stestr run \
    --exclude-regex 'test_pep_517_support|test_requirement_parsing'
}

package() {
  cd pbr
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
