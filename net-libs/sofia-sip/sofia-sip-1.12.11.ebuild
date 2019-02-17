# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=4

DESCRIPTION="RFC3261 compliant SIP User-Agent library"
HOMEPAGE="http://sofia-sip.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1+ BSD public-domain" # See COPYRIGHT
SLOT="0"
KEYWORDS="alpha amd64 ~arm ~arm64 ia64 ppc ~ppc64 sparc x86 ~x86-linux"
IUSE="libressl ssl static-libs"

RDEPEND="dev-libs/glib:2
	ssl? (
		!libressl? ( dev-libs/openssl )
		libressl? ( dev-libs/libressl )
	)"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

# tests are broken, see bugs 304607 and 330261
RESTRICT="test"

DOCS=( AUTHORS ChangeLog README README.developers RELEASE TODO )

src_configure() {
	econf \
		$(use_enable static-libs static) \
		$(use_with ssl openssl)
}

src_install() {
	default
	rm -f "${ED}"usr/lib*/lib${PN}*.la
}
