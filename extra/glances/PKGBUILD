# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=glances
pkgver=4.3.0.5
pkgrel=1
pkgdesc="CLI curses-based monitoring tool"
url="https://nicolargo.github.io/glances"
arch=('any')
license=('LGPL-3.0-or-later')
depends=('python' 'python-psutil' 'python-defusedxml' 'python-orjson' 'python-pydantic' 'python-packaging')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('hddtemp: HDD temperature monitoring support'
            'uvicorn: for WebUI / RestFull API'
            'python-jinja: for WebUI / RestFull API'
            'python-fastapi: for WebUI / RestFull API'
            'python-docker: for the Docker monitoring support'
            'python-matplotlib: for graphical/chart support'
            'python-netifaces: for the IP plugin'
            'python-zeroconf: for the autodiscover mode'
            'python-pystache: templating engine'
            'python-prometheus_client: for the Prometheus export module')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nicolargo/glances/archive/v${pkgver}.tar.gz"
        "${pkgname}.service")
sha512sums=('5ba281c79f73b81debd959523ff813c2c39a49259d04d64b50d918910d9451f46799b76b5e4b9857cc03352b73828516e5f1fd98cf0261437829ec44fc03d125'
            '49f0d185a37a5c5837e5beb463770c943ede40b2f1b8405e338129e897e97d9fc58373a8586fabc506266e6343cfea3c91b9787ac6832cc97a1ab63d6ad058d4')
b2sums=('39c940be53ac839c025c67f8823146ba4720a862efc9f1231f9166f4bfec4f9cb348abe8e0ca29677864aa77874326046fdbefa8763a7373a459890b19cc3178'
        'ecc44f8c06b1e8624cec92e41422a65d11e024b9fc23bae09b4e52fbedeb172a5034e5b612bbff7ba93d45189fb25eda0d54bc47b22b7f3f0acba984391e4017')

build() {
	cd "${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

