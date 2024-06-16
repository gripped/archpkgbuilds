# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ismael Carnales <icarnales at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=autopep8
pkgver=2.3.0
pkgrel=1
epoch=1
pkgdesc='A tool that automatically formats Python code to conform to the PEP 8 style guide'
arch=('any')
url='https://github.com/hhatto/autopep8'
license=('MIT')
depends=(
  'python'
  'python-pycodestyle'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=('python-pytest')
_commit='8f12c0ab83c3dcc9eaf5078393dd2c53e1d253d2'
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('98565898bbb0f06f860a5a25e52cc6541d2975a95fec8e4687650b939b42dd83c96a02ab1eaca4224fc98272eb4089f62eafed80994f6760f03f5f748b231063')
b2sums=('ca9d308c6abfc76dba3ad00bec0452a771fd0fe5669308a90c1866312ec820ad3ad42adeb139b985676cb4109a2681c4487817c922ee24c794b678d4e17481cd')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v -k 'not test_e204'
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/$pkgname-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
