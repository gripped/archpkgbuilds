# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-tiktoken
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="A fast BPE tokeniser for use with OpenAI's models"
arch=(x86_64)
url="https://github.com/openai/tiktoken"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
  python-regex
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-rust
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pytest
)
optdepends=(
  'python-blobfile: for reading blobfiles'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6ac7a9cfe9f9c4d111ea633b7ae2214ba504a6a4e994b26dff28b3bdee919293')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -r tiktoken tiktoken.egg-info tiktoken_ext
  local python_version
  python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="build/lib.linux-$CARCH-cpython-$python_version" python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
