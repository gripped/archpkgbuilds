# Maintainer: Torsten Keßler <tpkessler@archlinux.org>
pkgbase=cudnn-frontend
pkgname=(${pkgbase} python-${pkgbase})
pkgver=1.32.0
pkgrel=1
pkgdesc="Modern, open-source entry point to the cuDNN library"
arch=("x86_64")
url="https://docs.nvidia.com/deeplearning/cudnn/latest/"
license=("MIT")
makedepends=(
	git
	cmake
	ninja
	cuda
	cudnn
	catch2
	nanobind
	python
	python-build
	python-installer
	python-wheel
	python-setuptools
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/cudnn-frontend/archive/refs/tags/v${pkgver}.tar.gz"
	pyproject.patch)
sha256sums=('f4fe84095f848dd77b148feb592bc4ac4a3b085cd3fe1d9e95e1911e846f7ed1'
            '9fa9afab152caf6f11dbf850aecfafa18d8cb3d24c298c682a779bcb22a1159f')

prepare() {
	cd ${pkgname}-${pkgver}
	# Drop cmake, ninja, and pybind11 dependencies from pyproject.toml
	patch -p1 < ../pyproject.patch
}

build() {
	local cmake_args=(
		-Wno-dev
		-G Ninja
		-B build
		-S ${pkgbase}-${pkgver}
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
	)
	echo "Build C++ library"
	cmake "${cmake_args[@]}"
	cmake --build build

	echo "Build python wrapper"
	cd ${pkgbase}-${pkgver}
	python -m build --wheel --no-isolation
}

package_cudnn-frontend() {
	depends+=(
		glibc
		libstdc++
		libgcc
		cuda
		cudnn
	)
	DESTDIR="${pkgdir}" cmake --install build
	cd ${pkgbase}-${pkgver}
	install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python-cudnn-frontend() {
	depends+=(
		glibc
		libstdc++
		libgcc
		python
		cuda
		cudnn
	)
	cd ${pkgbase}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
