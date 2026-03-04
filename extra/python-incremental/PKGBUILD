# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-incremental
pkgver=24.7.2
pkgrel=4
pkgdesc='A small library that versions your Python projects'
arch=('any')
license=('MIT')
depends=('python-click' 'python-packaging' 'python-twisted')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
url='https://github.com/hawkowl/incremental'
checkdepends=('python-pytest')
source=("git+https://github.com/hawkowl/incremental.git#tag=incremental-$pkgver")
sha512sums=('25dee34209c856eeacb23f29c0cede207f354c136634bc6ca73a8389d727b0594714cb0c29330d4a5c97d547e6efd85b8bc7f30d1b833d04db427e9f51aa0cfd')

prepare() {
  cd incremental
  # Replace pkg_resources.parse_version with packaging.version.Version
  git cherry-pick -n 16001dabdb335084b86f3ac8db3f166121d56ec9
}

build() {
  cd incremental
  python -m build --wheel --no-isolation
}

check() {
  cd incremental
  pytest src
}

package() {
  cd incremental
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
