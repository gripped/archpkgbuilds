# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-xmlsec
pkgver=1.3.15
pkgrel=1
pkgdesc="Python bindings for the XML Security Library"
url="https://github.com/mehcode/python-xmlsec"
license=('MIT')
arch=('x86_64')
depends=('glibc' 'libxml2' 'python-lxml' 'xmlsec')
makedepends=('git' 'python-build' 'python-installer' 'python-pkgconfig' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-hypothesis' 'python-pytest')
source=("git+https://github.com/mehcode/python-xmlsec.git#tag=$pkgver")
sha512sums=('9b212fa808402bf458efda2e06e6c17a5135a3252539811fc1ed8d79cc8bef770a6491c6e88191340396844d1bfe8e36c7c0830d0542ed9dfe6ea5f72b12e526')

build() {
  cd python-xmlsec
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    # https://github.com/xmlsec/python-xmlsec/issues/84
    --deselect 'tests/test_doc_examples.py::test_doc_example[encrypt.py]'
    --deselect 'tests/test_doc_examples.py::test_doc_example[sign.py]'
    --deselect 'tests/test_doc_examples.py::test_doc_example[verify.py]'
    # https://github.com/xmlsec/python-xmlsec/issues/244
    --deselect tests/test_ds.py::TestSignContext::test_sign_case5
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd python-xmlsec
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv "${pytest_options[@]}"
}

package() {
  cd python-xmlsec
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
