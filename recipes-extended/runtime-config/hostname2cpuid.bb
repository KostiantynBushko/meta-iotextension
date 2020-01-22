SUMMARY = "Update Hostname at runtime"
DESCRIPTION = "Update Hostname at runtime using cpuid"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} += "hostname2cpuid.service"

do_install() {
   install -m 0755 -d ${D}${systemd_unitdir}/system
   install -m 0644 ${THISDIR}/files/hostname2cpuid.service ${D}${systemd_unitdir}/system/hostname2cpuid.service

   install -d ${D}${bindir}
   install -m 0755 ${THISDIR}/files/hostname2cpuid.sh ${D}${bindir}/hostname2cpuid.sh
}

FILES_${PN} = " \
  ${systemd_unitdir}/system/hostname2cpuid.service \
  ${bindir}/hostname2cpuid.sh \
"
