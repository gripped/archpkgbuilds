# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-xmlsec
pkgver=1.3.16
pkgrel=2
pkgdesc="Python bindings for the XML Security Library"
url="https://github.com/mehcode/python-xmlsec"
license=('MIT')
arch=('x86_64')
depends=('glibc' 'libxml2' 'python-lxml' 'xmlsec')
makedepends=('git' 'python-build' 'python-installer' 'python-pkgconfig' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-hypothesis' 'python-pytest')
source=("git+https://github.com/mehcode/python-xmlsec.git#tag=$pkgver")
sha512sums=('b5e06fd3df8f7b5cc3c5ceaa8d0f8cbaf951a22db9e74622db953653855f4195075d086d20c4ebe71290d59bf298adf6afdab572fcebc93a7b141450b13f40f0')

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
