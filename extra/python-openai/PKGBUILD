# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-openai
_name=openai-python
pkgver=2.11.0
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
_openai_openapi_spec=41f98da99f44ebe6204fce5c1dc9940f85f3472779e797b674c4fdc20306c77d
source=(
  "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://storage.googleapis.com/stainless-sdk-openapi-specs/openai%2Fopenai-${_openai_openapi_spec}.yml"
)
b2sums=('8ed3806593bcf0de99289f282477f430c69ff2fa065b97e7e9eb65657cc4c5f525a78c46dc18c18a01d87a80fc45f08b3fbd3b5de69d733729503e3bdbbce0af'
        '5c68f2ad04f5d2250aeb31d95a6bfab2f1e91f12a3a43591272ecedd67fcb8af3dc35885fce28cf2065525bd8f5bcd13faf5c49c260e8dcac77c33b7384169a8')

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
