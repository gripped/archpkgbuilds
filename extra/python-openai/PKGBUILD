# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-openai
_name=openai-python
pkgver=2.14.0
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
  'nodejs-lts-jod'
  'npm'
  'procps-ng'
  'python-dirty-equals'
  'python-httpx-aiohttp'
  'python-inline-snapshot'
  'python-nest-asyncio'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-xdist'
  'python-respx'
  'python-rich'
)
optdepends=(
  'python-httpx-aiohttp: Use aiohttp as HTTP backend'
  'python-numpy: Datalib support'
  'python-pandas: Datalib support'
  'python-websockets: Realtime support'
)
# Defined in .stats.yml
# curl -s https://raw.githubusercontent.com/openai/openai-python/refs/tags/v1.71.0/.stats.yml | grep openapi_spec_url | cut -d- -f5 | cut -d. -f1
_openai_openapi_spec=75926226b642ebb2cb415694da9dff35e8ab40145ac1b791cefb82a83809db4d
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://storage.googleapis.com/stainless-sdk-openapi-specs/openai%2Fopenai-${_openai_openapi_spec}.yml"
)
b2sums=('76cb6b3876423304d690715785b94b70c106a3a513bdb91d95a04ed04d30a4049d9a09597001c5674325eb5df61b01aa6e9cfe0627fec47d16eb540d18877cd1'
        '2b773dceaaa5948c059a654fedcc67ac3b701086fa88803aad4727971c0e8c29dea1f46f6b30870a74236fe8831f560713d75bb307afa90a45368ee06ed42864')

prepare() {
  cd "${_name}-${pkgver}"
  grep -q "openai-$_openai_openapi_spec.yml" .stats.yml \
    || { echo "Update _openai_openapi_spec"; exit 1; }
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
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
    --deselect tests/lib/chat/test_completions.py::test_parse_method_in_sync \
    --deselect tests/lib/chat/test_completions_streaming.py::test_stream_method_in_sync \
    --deselect tests/lib/test_assistants.py::test_create_and_run_poll_method_definition_in_sync \
    --deselect tests/lib/test_assistants.py::test_create_and_run_stream_method_definition_in_sync \
    --deselect tests/test_client.py::TestAsyncOpenAI::test_copy_build_request \
    --deselect tests/test_client.py::TestOpenAI::test_copy_build_request \
    --deselect tests/test_transform.py::test_base64_file_input
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
