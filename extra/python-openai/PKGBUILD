# Maintainer: Justin Kromlinger <hashworks@archlinux.org>
# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Liam Timms <timms5000@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=python-openai
_name=openai-python
pkgver=1.75.0
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
  'python-nest-asyncio'
  'python-respx'
  'python-rich'
)
optdepends=(
  'python-numpy: Datalib support'
  'python-pandas: Datalib support'
  'python-websockets: Realtime support'
)
# Defined in .stats.yml
# curl -s https://raw.githubusercontent.com/openai/openai-python/refs/tags/v1.71.0/.stats.yml | grep openapi_spec_url | cut -d- -f5 | cut -d. -f1
_openai_openapi_spec=5633633cc38734869cf7d993f7b549bb8e4d10e0ec45381ec2cd91507cd8eb8f
source=(
  "${_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "https://storage.googleapis.com/stainless-sdk-openapi-specs/openai%2Fopenai-${_openai_openapi_spec}.yml"
)
sha256sums=('a2da4580c1ae5678ac5dc8b19e47df37ed6037752bba0ad162ecb7bdab4dc904'
            '5633633cc38734869cf7d993f7b549bb8e4d10e0ec45381ec2cd91507cd8eb8f')

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
    --deselect tests/test_client.py::TestAsyncOpenAI::test_copy_build_request \
    --deselect tests/test_client.py::TestOpenAI::test_copy_build_request
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
