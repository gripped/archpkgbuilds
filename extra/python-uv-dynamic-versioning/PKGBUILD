# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-uv-dynamic-versioning
pkgver=0.14.0
pkgrel=1
pkgdesc="Dynamic versioning based on VCS tags for uv/hatch projects"
arch=(any)
url="https://github.com/ninoseki/uv-dynamic-versioning"
license=(MIT)
depends=(
  python
  python-dunamai
  python-hatchling
  python-jinja
  python-tomlkit
)
makedepends=(
  git
  python-build
  python-installer
)
checkdepends=(
  python-gitpython
  python-pytest
)
source=("$pkgname::git+$url#tag=v$pkgver")
b2sums=('80f4e51eb17d38c55d611da753edf104800fedb3aa0b1cd5e408f0bff84c474e288b417565d7cae9ee4e39288e985f9402eb1b4c2a5064396f2a24c67f70452c')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  # Provide committer identity for the commit-based tests.
  export GIT_AUTHOR_NAME=pkg GIT_AUTHOR_EMAIL=pkg@localhost
  export GIT_COMMITTER_NAME=pkg GIT_COMMITTER_EMAIL=pkg@localhost
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
