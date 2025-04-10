# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=3.0.1
pkgrel=1
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python python-rich python-markdown-it-py python-typing_extensions python-platformdirs)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-asyncio python-time-machine python-linkify-it-py)
optdepends=('python-tree-sitter: for syntax highlighting support'
            'python-tree-sitter-languages: for custom languages support'
            'python-textual-dev: tools for developers')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
        fix_tests_with_pytest-asyncio_0.25.0.patch)
sha512sums=('ac2169fe200fc501ce7f2ddb48ef5a009afb66b1ddb0337b79c57742a55a9fd1defd824ec793b0b197e985640dbeea4926593bfcda03dc276c230825a1ef79ae'
            'cf87b017605cfddcfe99010bf6d02139188892d5a4099fcdddf36b5c4c78aecf993d78b17ccd26399a8943b33d07fb402edb27323609ce7ca22c226dddff333d')

prepare() {
  cd ${_base}-${pkgver}
  # Backported patch to fix tests with pytest-asyncio >= 0.25.0
  # See https://github.com/Textualize/textual/issues/5511
  # and https://github.com/Textualize/textual/pull/5687
  patch -Np1 -i "${srcdir}/fix_tests_with_pytest-asyncio_0.25.0.patch"
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
