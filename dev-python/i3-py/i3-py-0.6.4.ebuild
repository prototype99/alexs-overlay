# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit python-r1
inherit distutils-r1

MY_PN="i3-py"
MY_P="${MY_PN}-${PV/_/-}"

DESCRIPTION="tools for i3 users and developers"
HOMEPAGE="https://github.com/ziberna/i3-py"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="test? ( dev-python/nose[${PYTHON_USEDEP}] )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

python_test() {
	nosetests || die "Tests fail with ${EPYTHON}"
}
