# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pydantic-settings
pkgname=python-pydantic-settings
pkgver=2.2.0
pkgrel=1
pkgdesc="Settings management using pydantic"
arch=(any)
url="https://github.com/pydantic/pydantic-settings"
license=(MIT)
depends=(
  python
  python-dotenv
  python-pydantic
  python-typing-extensions
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
checkdepends=(
  python-pytest
  python-pytest-examples
  python-pytest-mock
)
optdepends=(
  'python-pyyaml: for YAML support'
  'python-tomlkit: for TOML support'
)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('c5526bdfa5c08eece394d5f61f1ea4db61066939c46bc7ddf179f0ee570f9328c0960a42fc1064cb89785443f7c27db5b7a1754b29649b10d062cf18287c06cc')
b2sums=('f361bef8b6ae9012bcada598a46077122b1141ff8725e80b6708a6ebf3dcea3ae12aa2f99ce21230be754ef0590550a32d5535aa65088554ce1353f1186ea213')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
