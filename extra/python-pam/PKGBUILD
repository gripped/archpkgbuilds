# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python-pam
pkgver=2.0.2
pkgrel=6
pkgdesc='Pure Python interface to the Pluggable Authentication Modules system'
arch=(any)
url='https://github.com/FirefighterBlu3/python-pam'
license=(MIT)
depends=(python pam)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('5677d5e478d2be48a38c256ee8d54977546905016f58eb70afe8b9cd40fae62170bf7bf42711fa5017d20d20f23ae1bcc12d88ef1aee2b95434dc6015a4c0e6d')
b2sums=('c3c33b9c1a5779bd5c98bb498fb79d750aeb747206aa554427606f232eb4f95b5b4aebf88796f3b1140f9b6ecb1aff183cecbb7488c73cb6ad4b572e39b55f2b')

prepare() {
  cd "$pkgname"

  # remove depdendency on python-six
  git cherry-pick --no-commit 8d6f8eefcb0b0edafa585d23d6b3f2169d8e1c6f
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  # install to temporary directory
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  PYTHONPATH="$PWD/tmp_install$site_packages" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
