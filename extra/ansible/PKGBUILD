# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=ansible
pkgver=8.6.1
pkgrel=1
pkgdesc='Official assortment of Ansible collections'
arch=('any')
url='https://pypi.org/project/ansible/'
license=('GPL3')
depends=('python' 'ansible-core')
provides=('python-ansible_collections')
optdepends=('python-argcomplete: shell completions'
            'python-pyopenssl: openssl modules'
            'python-dnspython: for dig lookup'
            'python-ovirt-engine-sdk: ovirt support'
            'python-boto3: aws_s3 module'
            'python-ldap: ldap support'
            'python-proxmoxer: proxmos modules'
            'python-openstacksdk: OpenStack module'
            'python-pynetbox: NetBox module'
            'python-ldap: LDAP modules'
            'python-kubernetes: Kubernetes modules'
            'python-keyring: Keyring module'
            'python-github3py: GitHub module'
            'acme-tiny: openssl_certificate module')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/a/ansible/ansible-${pkgver}.tar.gz")
sha512sums=('92cb3909693b54c47b88987aa92b3ca7caa1765f16a7e4c88abf0e3ff70e9d764de145fffdc56d04c40b4d4d6551775cfd7b99423373feffe6706ef80c84baa4')

build() {
  cd ansible-${pkgver}
  python setup.py build
}

package() {
  cd ansible-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}"/usr/share/doc/${pkgname}/COPYING
}
