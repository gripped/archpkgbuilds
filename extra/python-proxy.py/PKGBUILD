# Maintainer:
# Contributor: Jonas Witschel <diabonas@archlinux.org>

pkgname=python-proxy.py
_name=${pkgname#python-}
pkgver=2.4.9
pkgrel=1
pkgdesc='Lightweight HTTP, HTTPS, HTTP2 and WebSockets proxy server'
arch=(any)
url=https://github.com/abhinavsingh/proxy.py
license=(BSD-3-Clause)
depends=(
  python
  python-setuptools
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-httpx
  python-pytest
  python-pytest-asyncio
  python-pytest-mock
  python-requests
)
optdepends=(
  'python-httpx: Cloudflare DNS resolver plugin support'
  'python-paramiko: proxy over SSH tunnel support'
)
source=(
  # may have unreproducible tarballs until issue is solved: https://github.com/abhinavsingh/proxy.py/issues/1394
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha512sums=('ff3806598534b4ca8fbf0c13e2ab6a917bd3b2b6b2392642bfd775ce9c49d1437e2871848133f15f9f80686fa91e5032be2926c747c33efe584704b78c0a34d2')
b2sums=('a0c7474cf6007b5171c9129af483ce785c1bcb1b76aedd448e697b38ffb4b7d84e096a1d8c44624c5bc9b2c1f513ee48b96adfc7399e24b549c310f0d24c9106')

build() {
  cd "$_name"-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -o addopts=''  # we are not interested in coverage
    --ignore tests/integration  # we are not interested in integration tests using the internet
    --deselect tests/http/proxy/test_http2.py::TestHttp2WithProxy::test_http2_via_proxy
    --deselect tests/http/exceptions/test_http_proxy_auth_failed.py::TestHttpProxyAuthFailed::test_proxy_auth_fails_without_cred
    --deselect tests/http/exceptions/test_http_proxy_auth_failed.py::TestHttpProxyAuthFailed::test_proxy_auth_fails_with_invalid_cred
    --deselect tests/http/exceptions/test_http_proxy_auth_failed.py::TestHttpProxyAuthFailed::test_proxy_auth_works_with_valid_cred
    --deselect tests/http/exceptions/test_http_proxy_auth_failed.py::TestHttpProxyAuthFailed::test_proxy_auth_works_with_mixed_case_basic_string
    --deselect tests/http/proxy/test_http_proxy.py::TestHttpProxyPlugin::test_proxy_plugin_on_and_before_upstream_connection
    --deselect tests/http/proxy/test_http_proxy.py::TestHttpProxyPlugin::test_proxy_plugin_before_upstream_connection_can_teardown
    --deselect tests/http/proxy/test_http_proxy_tls_interception.py::TestHttpProxyTlsInterception::test_e2e
    --deselect tests/http/test_protocol_handler.py::TestHttpProtocolHandlerWithoutServerMock::test_proxy_connection_failed
    --deselect tests/http/test_protocol_handler.py::TestHttpProtocolHandlerWithoutServerMock::test_proxy_authentication_failed
    --deselect tests/http/test_protocol_handler.py::TestHttpProtocolHandlerWithoutServerMock::test_proxy_bails_out_for_unknown_schemes
    --deselect tests/http/test_protocol_handler.py::TestHttpProtocolHandlerWithoutServerMock::test_proxy_bails_out_for_sip_request_lines
    --deselect tests/http/test_protocol_handler.py::TestHttpProtocolHandler::test_http_get
    --deselect tests/http/test_protocol_handler.py::TestHttpProtocolHandler::test_http_tunnel
    --deselect tests/http/test_protocol_handler.py::TestHttpProtocolHandler::test_authenticated_proxy_http_get
    --deselect tests/http/test_protocol_handler.py::TestHttpProtocolHandler::test_authenticated_proxy_http_tunnel
    --deselect tests/http/web/test_web_server.py::TestWebServerPluginWithPacFilePlugin::test_pac_file_served_from_disk
    --deselect tests/http/web/test_web_server.py::TestStaticWebServerPlugin::test_static_web_server_serves
    --deselect tests/http/web/test_web_server.py::TestStaticWebServerPlugin::test_static_web_server_serves_404
    --deselect tests/http/web/test_web_server.py::TestWebServerPlugin::test_default_web_server_returns_404
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_modify_post_data_plugin
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_proposed_rest_api_plugin
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_redirect_to_custom_server_plugin
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_redirect_to_custom_server_plugin_skips_https
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_filter_by_upstream_host_plugin
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_man_in_the_middle_plugin
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_filter_by_url_regex_plugin
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_shortlink_plugin
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_shortlink_plugin_unknown
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_shortlink_plugin_external
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_auth_plugin
    --deselect tests/plugin/test_http_proxy_plugins.py::TestHttpProxyPluginExamples::test_auth_plugin_bypass
    --deselect tests/plugin/test_http_proxy_plugins_with_tls_interception.py::TestHttpProxyPluginExamplesWithTlsInterception::test_modify_post_data_plugin
    --deselect tests/plugin/test_http_proxy_plugins_with_tls_interception.py::TestHttpProxyPluginExamplesWithTlsInterception::test_man_in_the_middle_plugin
  )

  cd "$_name"-$pkgver
  pytest "${pytest_options[@]}"
}

package() {
  cd "$_name"-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  # Remove entry point usr/bin/proxy to avoid conflict with libproxy (FS#73325)
  cd "$pkgdir"
  rm -r usr/bin
}
