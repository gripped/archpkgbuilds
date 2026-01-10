# Maintainer: Leonidas Spyropoulos <artafinde@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Jose Riha <jose 1711 gmail com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=7.0.1
pkgrel=1
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python python-rich python-markdown-it-py python-typing_extensions python-platformdirs)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-asyncio python-time-machine python-linkify-it-py python-pytest-xdist python-pytest-textual-snapshot)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('44b1a99f68211b684fc2954efcd1889970a75008caa1cc8f0f55b887c8157daa31b74b4882f54a900197791afdca9c7052d3a812965906c81e1204063d35bf79')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  # Execute tests in parallel 
  test-env/bin/python -m pytest \
    -n auto \
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
