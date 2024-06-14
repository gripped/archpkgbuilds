# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=0.68.0
pkgrel=1
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python python-rich python-markdown-it-py python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-asyncio python-time-machine)
optdepends=('python-tree-sitter: for syntax highlighting support'
            'python-tree-sitter-languages: for custom languages support'
            'python-textual-dev: tools for developers')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
        test_deadlock.patch::https://github.com/Textualize/textual/commit/e9ad400559c14645e56b7a98a467295c6817686b.patch)
sha512sums=('7253c793d8f1ce6b344408abb1529acbe6ecb8c452e23fd99dee1ba9776c58a9ec8e2122b1408b68cce3fa7c27ad63c88c4f13092dc887bfc5ce292560b1d4c3'
            'c399d408ce76b9e8860242ab09e86b5d46741eba5df9ee73b3068bf9cfaa4c44393882793127c27bf405d7219dda286f574ce4f1cc91fa5c2bf5ad8c471516fc')

prepare() {
  cd ${_base}-${pkgver}
  # Temporary patch to fix the test_deadlock check which fails because it expects `textual` to be installed in the test environment.
  # See https://github.com/Textualize/textual/issues/4649
  patch -Np1 < "${srcdir}/test_deadlock.patch"
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_markdown.py \
    --ignore=tests/test_markdownviewer.py \
    --ignore=tests/snapshot_tests/test_snapshots.py \
    --ignore=tests/test_slug.py \
    --ignore=tests/text_area/test_languages.py \
    -k 'not textual_env_var'
}

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
