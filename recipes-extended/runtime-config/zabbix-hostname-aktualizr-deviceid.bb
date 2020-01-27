SUMMARY = "Update Hostname at runtime"
DESCRIPTION = "Update Hostname at runtime using cpuid"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit systemd
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} += "zabbix-hostname-oneshot.service"

do_install() {
   install -m 0755 -d ${D}${systemd_unitdir}/system
   install -m 0644 ${THISDIR}/files/zabbix-hostname-oneshot.service ${D}${systemd_unitdir}/system/zabbix-hostname-oneshot.service

   install -d ${D}${bindir}
   install -m 0755 ${THISDIR}/files/hostname2cpuid.sh ${D}${bindir}/zabbix-hostname.sh
}

FILES_${PN} = " ${systemd_unitdir}/system/zabbix-hostname-oneshot.service \
  ${bindir}/zabbix-hostname.sh \
"