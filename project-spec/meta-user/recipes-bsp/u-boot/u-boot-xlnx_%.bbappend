FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://platform-top.h file://bsp.cfg file://user_2022-06-16-08-06-00.cfg file://user_2022-06-30-09-18-00.cfg"

do_configure:append () {
	install ${WORKDIR}/platform-top.h ${S}/include/configs/
}

do_configure:append:microblaze () {
	if [ "${U_BOOT_AUTO_CONFIG}" = "1" ]; then
		install ${WORKDIR}/platform-auto.h ${S}/include/configs/
		install -d ${B}/source/board/xilinx/microblaze-generic/
		install ${WORKDIR}/config.mk ${B}/source/board/xilinx/microblaze-generic/
	fi
}
