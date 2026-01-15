# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Marcel Campello <marcel.campello@prafrentex.com.br>
# Contributor: David Birks <david@birks.dev>

pkgname=aws-cli-v2
pkgver=2.32.32
pkgrel=1
pkgdesc='Universal Command Line Interface for Amazon Web Services (version 2)'
arch=('any')
url="https://docs.aws.amazon.com/cli"
_url="https://github.com/aws/aws-cli"
license=('Apache-2.0')
depends=(
  'python'
  'python-awscrt'
  'python-colorama'
  'python-dateutil'
  'python-distro'
  'python-docutils'
  'python-jmespath'
  'python-prompt_toolkit'
  'python-ruamel-yaml'
  'python-urllib3'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-jsonschema'
  'python-pytest'
  'python-pytest-xdist'
)
provides=(aws-cli)
conflicts=(aws-cli)
install=$pkgname.install
source=(
  "git+$_url#tag=$pkgver"
  "https://github.com/boto/botocore/commit/f0ff061aebd9ef15a66f87b675789275e373da43.patch"
  "$pkgname-python-prompt-toolkit-3.0.52-compat.patch"
  "$pkgname-python-3.14-argparse-compat.patch"
)
b2sums=('e395cf6b616703ddbdb36754d38491fe5dc057bbf0e5850bc8fe4c86ad2a072bed3329bc3e51d22ade2a01f1c6e7e463a7ca4295e509939907604a85e3e83247'
        '34b49f02e77f5b0918df1ec61ba7076d6a795cb9d55708261aa6cfc2d065e4282c88ea6f4c40e0de6c7ca380056f527962cafc309ac9cc76e0286bcc1be6b409'
        'e8a53aa1c524f38baedf8062e8ef5a8591e7eac053d52d772f3015debdb87100ffcb4974137a6cd0226f7709379de683ff1cff4c89a24c0c3a87f32541ccbca0'
        'b11a980fd602f7ed61575677c4e75af7ce7784d9f3ff8ed4d7b9f7e830e8aae8780bbb27331f881d00d959469f7a35890725d1abc6e9d5f87b5ac632b3341ba6')

prepare() {
  cd ${pkgname%-v2}
  # Remove deprecated `strict` poolmanager kwarg (#3036)
  patch -Np1 -f -d awscli < ../f0ff061aebd9ef15a66f87b675789275e373da43.patch || :
  patch -Np3 -f -d tests/unit/botocore < ../f0ff061aebd9ef15a66f87b675789275e373da43.patch || :

  # Fix for python-prompt-toolkit 3.0.52
  patch -Np1 -f < ../$pkgname-python-prompt-toolkit-3.0.52-compat.patch
  # Fix Python 3.14 argparse compatibility
  patch -Np1 -f < ../$pkgname-python-3.14-argparse-compat.patch
}

build() {
  cd ${pkgname%-v2}
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd ${pkgname%-v2}
  local pytest_args=(
    -vv
    --numprocesses=auto

    # Not relevant to test build back-end and dependency versions, plus these
    # tests take forever and fills up /tmp.
    --ignore=tests/backends
    --ignore=tests/dependencies
    # Takes forever (15+ minutes) to collect.
    --ignore=tests/functional

    # Depends on urllib3 internals and fails with urllib3 2.X.
    --deselect=tests/unit/botocore/test_awsrequest.py::TestAWSHTTPConnection::test_expect_100_continue_returned
    --deselect=tests/unit/botocore/test_awsrequest.py::TestAWSHTTPConnection::test_expect_100_sends_connection_header
    --deselect=tests/unit/botocore/test_awsrequest.py::TestAWSHTTPConnection::test_expect_100_continue_sends_307
    --deselect=tests/unit/botocore/test_awsrequest.py::TestAWSHTTPConnection::test_handles_expect_100_with_different_reason_phrase
    --deselect=tests/unit/botocore/test_awsrequest.py::TestAWSHTTPConnection::test_expect_100_continue_no_response_from_server
    --deselect=tests/unit/botocore/test_awsrequest.py::TestAWSHTTPConnection::test_state_reset_on_connection_close

    # Fails with:
    # FileNotFoundError: [Errno 2] No such file or directory: 'temp_creds.csv'
    --deselect=tests/unit/customizations/configure/test_importer.py::TestConfigureImportCommand::test_csv_content_from_file_succeeds

    # Calls AWS services and requires credentials.
    --deselect=tests/integration/botocore/test_apigateway.py
    --deselect=tests/integration/botocore/test_client.py
    --deselect=tests/integration/botocore/test_cloudwatch.py
    --deselect=tests/integration/botocore/test_cognito_identity.py
    --deselect=tests/integration/botocore/test_credentials.py
    --deselect=tests/integration/botocore/test_ec2.py
    --deselect=tests/integration/botocore/test_elastictranscoder.py
    --deselect=tests/integration/botocore/test_emr.py
    --deselect=tests/integration/botocore/test_glacier.py
    --deselect=tests/integration/botocore/test_rds.py
    --deselect=tests/integration/botocore/test_route53.py
    --deselect=tests/integration/botocore/test_s3.py
    --deselect=tests/integration/botocore/test_session.py
    --deselect=tests/integration/botocore/test_smoke.py
    --deselect=tests/integration/botocore/test_sts.py
    --deselect=tests/integration/botocore/test_waiters.py
    --deselect=tests/integration/customizations/s3/test_filegenerator.py
    --deselect=tests/integration/customizations/s3/test_plugin.py
    --deselect=tests/integration/customizations/test_waiters.py
    --deselect=tests/integration/customizations/test_waiters.py
    --deselect=tests/integration/s3transfer
    --deselect=tests/integration/test_assume_role.py
    --deselect=tests/integration/test_cli.py
    --deselect=tests/integration/test_ec2.py
    --deselect=tests/integration/test_smoke.py::test_can_make_success_request

    # Fails for some reason
    --deselect=tests/integration/test_smoke.py::test_display_error_message

    # Fails due to Python 3.14 reference counting changes.
    --deselect=tests/unit/botocore/test_utils.py::test_lru_cache_weakref
  )
  export AWS_ACCESS_KEY_ID=fake_id
  export AWS_SECRET_ACCESS_KEY=fake_key
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PATH="$PWD/test-env/bin:$PATH" \
    test-env/bin/python -m pytest "${pytest_args[@]}"
}

package() {
  cd ${pkgname%-v2}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 bin/aws_bash_completer "$pkgdir/usr/share/bash-completion/completions/aws"
  rm -v "$pkgdir/usr/bin/aws.cmd"
  rm -v "$pkgdir/usr/bin/aws_bash_completer"
}
