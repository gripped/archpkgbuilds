# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Josh Holbrook <josh.holbrook@gmail.com>

pkgname=python-pyee
pkgver=11.0.0
pkgrel=1
pkgdesc="Port of node.js's EventEmitter to python"
arch=('any')
url=https://github.com/jfhbrook/pyee
license=('MIT')
depends=('python-typing-extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest-asyncio' 'python-pytest-trio' 'python-twisted')
optdepends=('python-trio' 'python-twisted')
source=("https://files.pythonhosted.org/packages/source/p/pyee/pyee-$pkgver.tar.gz")
sha256sums=('27c682bce60bdadc5d3e23eacd4101df328c0280884a3d9c07f3a4e3e595de27')
b2sums=('4d471531099569baa28d32cb86cc6ff4637ac94288898aaf0de30825d17f242ef588b147480f87497f4dbc7ef1a21a898ad900bcc1a8fe890b17ae046c73ef65')

build() {
  cd pyee-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd pyee-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd pyee-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/pyee-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
