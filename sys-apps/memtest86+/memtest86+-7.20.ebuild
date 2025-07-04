# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit mount-boot secureboot toolchain-funcs

MY_PV=${PV/_/-}

DESCRIPTION="Memory tester based on PCMemTest"
HOMEPAGE="https://www.memtest.org/"
SRC_URI="https://github.com/memtest86plus/memtest86plus/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/memtest86plus-${MY_PV}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~loong x86"
IUSE="bios32 bios64 +boot uefi32 uefi64 iso32 iso64"

ISODEPS="
	dev-libs/libisoburn
	sys-fs/dosfstools
	sys-fs/mtools
"
BDEPEND="
	iso32? ( ${ISODEPS} )
	iso64? ( ${ISODEPS} )
	sys-devel/gcc:*
"

pkg_setup() {
	if use uefi32 || use uefi64; then
		secureboot_pkg_setup
	fi
}

src_prepare() {
	sed -i \
		-e 's#/sbin/mkdosfs#mkfs.vfat#' \
		-e 's/^AS = as/AS +=/' \
		-e '/^CC/d' \
		-e 's/= objcopy/?= $(OBJCOPY)/' \
		-e 's/shell size/shell $(SIZE)/' \
		build{32,64}/Makefile || die

	if ! tc-is-gcc; then
		ewarn "clang doesn't support indirect goto in function with no address-of-label expressions"
		ewarn "Ignoring CC=$(tc-getCC) and forcing ${CHOST}-gcc"
		export CC=${CHOST}-gcc AR=${CHOST}-gcc-ar
		tc-is-gcc || die "tc-is-gcc failed in spite of CC=${CC}"
	fi

	default
}

src_compile() {
	tc-export OBJCOPY
	export SIZE=$(tc-getPROG SIZE size)

	if use loong; then
		# a different build directory has to be selected for loong, and
		# there's no "BIOS" support.
		pushd build64/la64
			use uefi64 && emake memtest.efi
			use iso64 && emake iso
		popd
		return
	fi

	pushd build32
		use bios32 && emake memtest.bin
		use uefi32 && emake memtest.efi
		use iso32 && emake iso
	popd

	pushd build64
		use bios64 && emake memtest.bin
		use uefi64 && emake memtest.efi
		use iso64 && emake iso
	popd
}

install_memtest_images() {
	if use loong; then
		use uefi64 && newins build64/la64/memtest.efi memtest.efi64
		return
	fi

	use bios32 && newins build32/memtest.bin memtest32.bios
	use bios64 && newins build64/memtest.bin memtest64.bios
	use uefi32 && newins build32/memtest.efi memtest.efi32
	use uefi64 && newins build64/memtest.efi memtest.efi64
}

src_install() {
	default
	if use boot; then
		exeinto /etc/grub.d/
		newexe "${FILESDIR}"/39_memtest86+-r2 39_memtest86+
		insinto /boot/memtest86plus
		install_memtest_images
	fi

	insinto /usr/share/${PN}
	install_memtest_images
	if use loong; then
		use iso64 && newins build64/la64/memtest.iso memtest64.iso
	else
		use iso32 && newins build32/memtest.iso memtest32.iso
		use iso64 && newins build64/memtest.iso memtest64.iso
	fi

	if use uefi32 || use uefi64; then
		secureboot_auto_sign --in-place
	fi
}

pkg_pretend() {
	use boot && mount-boot_pkg_pretend
}

pkg_preinst() {
	use boot && mount-boot_pkg_preinst
}

pkg_prerm() {
	use boot && mount-boot_pkg_prerm
}
