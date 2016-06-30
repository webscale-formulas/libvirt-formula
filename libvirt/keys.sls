include:
  - libvirt

libvirt.keys:
  virt.keys:
    - name: libvirt_keys
    - require:
      - pkg: libvirt
