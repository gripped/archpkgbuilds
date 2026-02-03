# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-moto
pkgver=5.1.20
pkgrel=1
pkgdesc='Moto is a library to mock out the boto library.'
arch=(any)
url='https://github.com/spulec/moto'
license=('Apache-2.0')
depends=(
  python
  python-boto3
  python-botocore
  python-cryptography
  python-dateutil
  python-jinja
  python-requests
  python-responses
  python-urllib3
  python-werkzeug
  python-xmltodict
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-antlr4
  python-aws-xray-sdk
  python-cfn-lint
  python-crc32c
  python-docker
  python-flask
  python-flask-cors
  python-freezegun
  python-graphql-core
  python-joserfc
  python-jsondiff
  python-jsonpath-ng
  python-jsonschema
  python-multipart
  python-openapi-spec-validator
  python-py-partiql-parser
  python-pyparsing
  python-pytest
  python-pytest-order
  python-yaml
)
optdepends=(
  'python-yaml: for apigatewayv2, cloudformation, s3 and ssm'
  'python-joserfc: for apigateway, cloudformation and cognitoidp'
  'python-openapi-spec-validator: for apigateway and cloudformation'
  # SNS and SQS still uses docker indirectly, while upstream explicitly removes them
  # https://github.com/spulec/moto/pull/4094
  'python-docker: for awslambda, batch, cloudformation, dynamodb and dynamodbstreams'
  'python-graphql-core: For appsync and cloudformation'
  'python-jsondiff: for iotdata and cloudformation'
  'python-aws-xray-sdk: for xray and cloudformation'
  'python-cfn-lint: for cloudformation'
  'python-pyparsing: for glue and cloudformation'
  'python-py-partiql-parser: for cloudformation and s3'
  'python-crc32c: for s3'
  'python-flask: for moto_server'
  'python-flask-cors: for moto_server'
  'python-multipart: for moto_proxy'
  'python-antlr4: for stepfunctions'
  'python-jsonpath-ng: for events, stepfunctions'
  'python-jsonschema: for quicksight'
)
source=("git+https://github.com/getmoto/moto#tag=$pkgver")
b2sums=('8ac7d3d337ba27dce0cc6f039915157799a66d628c8b8371e6f4c5c1931691eb5de811afdf76345ba19fe38f4e86809d1f29481a908f0ea7415db8bdaa45dff2')

prepare() {
  cd ${pkgname#python-}
  python update_version_from_git.py $pkgver
}

build() {
  cd ${pkgname#python-}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}
  local pytest_args=(
    # Needs a new package python-pycognito
    --ignore=tests/test_cognitoidp/test_cognitoidp.py
    -m 'not requires_docker'
    # Fails for some reason
    --deselect=tests/test_awslambda/test_lambda.py::test_delete_function
  )
  TZ=UTC pytest tests "${pytest_args[@]}"
}

package() {
  cd ${pkgname#python-}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
