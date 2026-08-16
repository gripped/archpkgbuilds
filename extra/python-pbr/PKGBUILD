# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python-pbr
pkgver=7.1.0
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
sha512sums=('bd78a0143829edb504fb5308c56d5dbda5d616e5e112b4a00f50d91a4ca4eaa8d88410434873abc481d4edda4a8735896204a3fd63bc89a82dcbc4cac063bb29')

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
