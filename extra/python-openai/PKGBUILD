# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-openai
_name=openai-python
pkgver=3.1.0
pkgrel=1
pkgdesc="Python client library for the OpenAI API"
arch=('any')
url="https://github.com/openai/openai-python"
license=('Apache-2.0' 'BSD-3-Clause')
depends=(
  'python'
  'python-anyio'
  'python-distro'
  'python-h2'
  'python-httpx2'
  'python-jiter'
  'python-pydantic'
  'python-pydantic-core'
  'python-sniffio'
  'python-tqdm'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-hatch-fancy-pypi-readme'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'nodejs-lts-krypton'
  'npm'
  'procps-ng'
  'python-dirty-equals'
  'python-aiohttp'
  'python-inline-snapshot'
  'python-nest-asyncio'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-xdist'
  'python-rich'
  'python-botocore'
  'python-jsonschema'
)
optdepends=(
  'python-aiohttp: Use aiohttp as HTTP backend'
  'python-httpx: Compatibility with legacy custom HTTP clients'
  'python-numpy: Datalib support'
  'python-pandas: Datalib support'
  'python-websockets: Realtime support'
  'python-botocore: AWS Bedrock OpenAI-compatible API support'
)
source=(
  "git+${url}.git#tag=v${pkgver}"
)
b2sums=('2d93b8b50e2e6bb8b0794a4513908c7feef99e588f91c6e8187c15227502918f557cfb8bfb616a3a0b25ba9019d3fc92f614d176bd7b4c33b273731ed9310a6b')

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "${_name}"
  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/${site_packages}"

  # Start mock server and make sure it's cleaned up on exit
  export npm_config_yes=true
  trap 'pkill "npm exec steady"' EXIT
  ./scripts/mock --daemon

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
  cd "${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm644 src/openai/_vendor/httpx_aiohttp/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/httpx-aiohttp-LICENSE"
}
