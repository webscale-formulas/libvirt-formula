{% from "libvirt/map.jinja" import libvirt_settings with context %}
include:
  - .install

libvirt.config:
  file.managed:
    - name: {{ libvirt_settings.libvirtd_config }}
    - template: jinja
    - source: salt://{{ slspath }}/templates/libvirtd.conf.jinja

{% if grains.get('os_family') == 'RedHat' %}
/etc/sysconfig/{{ libvirt_settings.libvirt_service }}:
  file.managed:
    - name: /etc/sysconfig/{{ libvirt_settings.libvirt_service }}
    - template: jinja
    - source: salt://{{ slspath }}/templates/sysconfig_libvirtd.jinja
    - watch_in:
      - service: libvirt.service
{% endif %}

{% if grains.get('os_family') == 'Debian' %}
/etc/sysconfig/{{ libvirt_settings.libvirt_service }}:
  file.managed:
    - name: /etc/sysconfig/{{ libvirt_settings.libvirt_service }}
    - template: jinja
    - source: salt://{{ slspath }}/templates/deb_default_libvirtd.jinja
    - watch_in:
      - service: libvirt.service
{% endif %}

