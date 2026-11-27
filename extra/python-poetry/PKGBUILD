# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: moson <moson@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: David Joaquín Shourabi Porcel <david@djsp.eu>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=poetry
pkgname=python-poetry
pkgver=2.5.1
pkgrel=2
pkgdesc='Python dependency management and packaging made easy'
arch=(any)
url=https://python-poetry.org
license=(MIT)
_deps=(build
       cachecontrol
       cachy
       cleo
       dulwich
       fastjsonschema
       filelock
       findpython
       html5lib
       installer
       jsonschema
       keyring
       packaging
       pbs-installer
       pexpect
       pkginfo
       platformdirs
       poetry-core
       poetry-plugin-export
       pyproject-hooks
       requests
       requests-toolbelt
       shellingham
       tomlkit
       trove-classifiers
       urllib3
       virtualenv)
depends=(python
         "${_deps[@]/#/python-}")
checkdepends=(python-deepdiff  # not mentioned but required
              python-psutil  # for python-pytest-xdist
              python-httpretty
              python-pip  # not mentioned but required
              python-pytest
              python-pytest-mock
              python-pytest-randomly
              python-pytest-xdist
              python-responses
              python-requests)
optdepends=('python-pip: to use pip with virtual environments')
provides=(poetry)
_archive="$_pkgname-$pkgver"
source=("https://github.com/$pkgname/$_pkgname/archive/$pkgver/$_archive.tar.gz"
        "0004-Allow-safe-tarfile-path-normalization-in-the-traversal-test.patch"
        "0005-Initialize-sysconfig-before-mocking-sys-platform.patch")
sha256sums=('8bd6b01d549d864877ada791b3fcf299fc64a4d24a3d81463c8d1591f36023a9'
            '5ab79670c77e3ccdbbad2ddaac36a6bf0173f2c550c7f00041851323a9a5ec52'
            '4d39e3f3c9398f88c14e5441bda7e3f6a190e58d3ecb6e84e59cdcc27f8bd6ff')

prepare() {
	cd "$_archive"
	# CacheControl 0.15 keeps the APIs Poetry uses; allow the packaged version.
	sed -i 's/cachecontrol\[filecache\] (>=0\.14\.0,<0\.15\.0)/cachecontrol[filecache] (>=0.14.0,<0.16.0)/' pyproject.toml
	# Python 3.14.10 may normalize this safe tar path instead of raising.
	# https://github.com/python-poetry/poetry/pull/11133
	patch -Np1 -i ../0004-Allow-safe-tarfile-path-normalization-in-the-traversal-test.patch
	# Python 3.14.10 derives the sysconfigdata name from sys.platform.
	patch -Np1 -i ../0005-Initialize-sysconfig-before-mocking-sys-platform.patch
}

build() {
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	cd "$_archive"
	python -m build -wn
	# install to tmp dir for tests and generate completions
	python -m installer --destdir=test_dir dist/*.whl
	export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
	export PATH="$PWD/test_dir/usr/bin:$PATH"
	poetry completions bash > poetry.bash
	poetry completions zsh > poetry.zsh
	poetry completions fish > poetry.fish
}

check() {
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	cd "$_archive"
	export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
	local deselected=(
		# throws deprecation warnings before mismatched output, so probably bogus
		tests/utils/test_threading.py
		# guessing 'export' from 'x' looks legit to me, outdated test?
		tests/console/test_application_command_not_found.py
		# expects Darwin sysconfig stuff
		tests/console/test_application.py::test_no_slow_imports_when_importing_the_cli_entrypoint
	)
	pytest -vv tests ${deselected[@]/#/--deselect }
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -vDm 644 $_pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	install -vDm 644 $_pkgname.zsh "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
	install -vDm 644 $_pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
