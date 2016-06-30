{% from "libvirt/map.jinja" import libvirt_settings with context %}

libvirt:
  pkg.installed:
    - name: {{ libvirt_settings.libvirt_pkg }}
  file.managed:
    - name: {{ libvirt_settings.libvirtd_config }}
    - template: jinja
    - source: salt://{{ slspath }}/templates/libvirtd.conf.jinja
  service.running:
    - name: {{ libvirt_settings.libvirt_service }}
    - enable: True
    - watch:
      - pkg: libvirt
      - file: libvirt 

qemu:
  pkg.installed:
    - pkg: {{ libvirt_settings.qemu_pkg }}

extra_pkgs:
  pkg.installed:
    - pkgs: {{ libvirt_settings.extra_pkgs }}

{% if grains.get('os_family') == 'RedHat' %}
/etc/sysconfig/{{ libvirt_settings.libvirt_service }}:
  file.managed:
    - name: /etc/sysconfig/{{ libvirt_settings.libvirt_service }}
    - template: jinja
    - source: salt://{{ slspath }}/templates/sysconfig_libvirtd.jinja
    - watch_in:
      - service: libvirt
{% endif %}

{% if grains.get('os_family') == 'Debian' %}
/etc/sysconfig/{{ libvirt_settings.libvirt_service }}:
  file.managed:
    - name: /etc/sysconfig/{{ libvirt_settings.libvirt_service }}
    - template: jinja
    - source: salt://{{ slspath }}/templates/deb_default_libvirtd.jinja
    - watch_in:
      - service: libvirt
{% endif %}
