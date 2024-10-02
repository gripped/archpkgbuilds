# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-openai
_name=openai-python
pkgver=1.50.2
pkgrel=1
pkgdesc="Python client library for the OpenAI API"
arch=('any')
url="https://github.com/openai/openai-python"
license=('MIT')
depends=(
  'python'
  'python-anyio'
  'python-distro'
  'python-h2'
  'python-httpx'
  'python-jiter'
  'python-pydantic'
  'python-pydantic-core'
  'python-sniffio'
  'python-tqdm'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-hatch-fancy-pypi-readme'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'npm'
  'procps-ng'
  'python-dirty-equals'
  'python-inline-snapshot'
  'python-pytest'
  'python-pytest-asyncio'
  'python-respx'
  'python-rich'
)
optdepends=(
  'python-numpy: Needed for CLI fine-tuning data preparation tool'
  'python-pandas: Needed for CLI fine-tuning data preparation tool'
  'python-openpyxl: Needed for CLI fine-tuning data preparation tool xlsx format'
  # 'python-wandb: Support for Weights & Biases' # Not packaged
  'python-scikit-learn: Needed for embedding utils'
  'python-tenacity: embeddings'
  'python-matplotlib: embeddings'
  'python-plotly: embeddings'
  'python-scipy: embeddings'
)
# Defined in .stats.yml
_openai_openapi_spec=71e58a77027c67e003fdd1b1ac8ac11557d8bfabc7666d1a827c6b1ca8ab98b5
source=(
  "${_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "https://storage.googleapis.com/stainless-sdk-openapi-specs/openai-${_openai_openapi_spec}.yml"
)
sha256sums=('a2952ee990f834846ec803a056737213f1b147d67e1940a6304663e6a00b5802'
            '71e58a77027c67e003fdd1b1ac8ac11557d8bfabc7666d1a827c6b1ca8ab98b5')

prepare() {
  cd "${_name}-${pkgver}"
  grep -q "openai-$_openai_openapi_spec.yml" .stats.yml \
    || { echo "Update _openai_openapi_spec"; exit 1; }
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/${site_packages}"

  # Start mock server and make sure it's cleaned up on exit
  trap 'pkill "npm exec prism"' EXIT
  ./scripts/mock --daemon "${srcdir}/openai-${_openai_openapi_spec}.yml"

  # Randomly generated mock API key
  export OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb
  pytest -W ignore::DeprecationWarning:pytest_asyncio.plugin \
    --deselect tests/test_client.py::TestAsyncOpenAI::test_copy_build_request \
    --deselect tests/test_client.py::TestOpenAI::test_copy_build_request
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
