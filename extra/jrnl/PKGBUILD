# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=jrnl
pkgver=4.2
pkgrel=2
pkgdesc="Collect your thoughts and notes without leaving the command line"
arch=('any')
url="https://jrnl.sh/"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-colorama'
  'python-cryptography'
  'python-dateutil'
  'python-keyring'
  'python-parsedatetime'
  'python-pyxdg'
  'python-rich'
  'python-ruamel-yaml'
  'python-tzlocal'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-pytest'
  'python-pytest-bdd'
  'python-pytest-xdist'
  'python-toml'
)
_url=https://github.com/jrnl-org/jrnl
source=(
  "$_url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "0001-Encapsulate-all-multiline-strings-in-triple-quotes-i.patch::$_url/commit/5f937721bfa279c7f2f197bb66b22580b12b3bbe.patch"
  "0002-Remove-comments-in-Gherkin-files-causing-test-breaka.patch::$_url/commit/a3e55c5e0d5bcf92e6fa8fc9c1c203b50029932d.patch"
  "0003-Fix-compatibility-of-step-functions-matching-on-mult.patch::$_url/commit/4d99448cddd42e06be4d4993b6af8973bee6ba95.patch"
)
sha512sums=('0fb58f23e11754246ea19679fb8e67ac06fd1fb1e0c025bd588da96bf0efa69254a3859a7581f9df831f8f8d9df120c4bfda3f96ab800567c7d7398d5a4676b5'
            'fd27558358ea7599aeb82de52dc2b225684dca6d81423a29a119871796eca043eebfdae83e96cd3b915cf7189deeed30070b1c64f8236e7b98656046407343ad'
            '553477974f4f079b76a643a6de282dc50ef7687f94b5d389e7119a58dd27bfb9c87d3e76a0229936149f0156885cad74ed4ce138063e1ab2b3e115233b2c0365'
            'f2828a3b11adbc1cf07fe2e70c977bfeb717dad70835f39ae68582fa966bfb70483516fbc0c93bde8d213c1cc2a672364269df87df2bdfb539e2c9efda652520')

prepare() {
  cd jrnl-$pkgver
  patch -Np1 -i ../0001-Encapsulate-all-multiline-strings-in-triple-quotes-i.patch
  patch -Np1 -i ../0002-Remove-comments-in-Gherkin-files-causing-test-breaka.patch
  patch -Np1 -i ../0003-Fix-compatibility-of-step-functions-matching-on-mult.patch
}

build() {
  cd jrnl-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd jrnl-$pkgver
  pytest
}

package() {
  cd jrnl-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
