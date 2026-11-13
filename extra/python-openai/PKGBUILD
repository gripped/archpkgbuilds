# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-openai
_name=openai-python
pkgver=3.3.1
pkgrel=1
pkgdesc="Python client library for the OpenAI API"
arch=('any')
url="https://github.com/openai/openai-python"
license=('Apache-2.0' 'BSD-3-Clause')
depends=(
  'python'
  'python-anyio'
  'python-h2'
  'python-httpx2'
  'python-jiter'
  'python-pydantic'
  'python-pydantic-core'
  'python-sniffio'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
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
b2sums=('6700bfe1673e119e2bbc118930a3f077dbbea460389805584deed208a3e022df44adb780c60c514de39b734c931fa72b717a341d8b35f767416f8e1b74d4feb4')

prepare() {
  cd "${_name}"
  # Run Steady with the packaged Node.js; upstream's launcher requires exactly 22.22.3.
  sed -i 's|node scripts/utils/node-tooling.cjs steady|npm exec --package=@stdy/cli@0.22.1 -- steady|' \
    scripts/run-steady
}

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
