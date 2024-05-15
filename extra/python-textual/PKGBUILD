# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=0.60.0
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
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ea2ce8fe468f865f1427ef16c5d93a1a4c2987864f005b3faa00a1249a68d08c8ae5e79622af8bc746d1bf59a7c1061b0f1a638ee55bd3ad694fdc882f2ab784')

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
