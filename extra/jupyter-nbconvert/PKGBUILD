# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=jupyter-nbconvert
_name=nbconvert
pkgver=7.16.3
pkgrel=2
pkgdesc='Jupyter Notebook Conversion'
arch=(any)
url='https://pypi.python.org/pypi/nbconvert'
license=(BSD-3-Clause)
depends=(ipython
         jupyter-nbclient
         jupyter-nbformat
         jupyterlab-pygments
         python
         python-beautifulsoup4
         python-bleach
         python-defusedxml
         python-importlib-metadata
         python-jinja
         python-jupyter-client
         python-jupyter-core
         python-markupsafe
         python-mistune
         python-packaging
         python-pandocfilters
         python-pygments
         python-tinycss2
         python-tornado
         python-traitlets)
makedepends=(python-build
             python-hatchling
             python-installer)
checkdepends=(python-flaky
              python-ipywidgets
              python-pyppeteer
              python-pytest)
optdepends=('pandoc: non-html conversion output'
            'python-pyppeteer: for webPDF conversion support')
source=(https://github.com/jupyter/nbconvert/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('533b03021e775b80b3f3f8ffa0e3ac76336c7847a948641d6174e544be097e7a')

build() {
  cd nbconvert-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd nbconvert-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m pip install -e .
  # disable tests that download chromium and (probably) require a graphical session
  test-env/bin/python -m pytest -v -k 'TestWebPDFExporter and not (test_export or test_webpdf_without_pyppeteer)' -W ignore::DeprecationWarning
  test-env/bin/python -m pytest -v -k 'TestNbConvertApp and not test_webpdf_with_chromium' -W ignore::DeprecationWarning
  # run all remaining tests
  test-env/bin/python -m pytest -v -k 'not TestWebPDFExporter and not TestNbConvertApp' -W ignore::DeprecationWarning
}

package() {
  cd nbconvert-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
