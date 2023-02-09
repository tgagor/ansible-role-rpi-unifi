Ansible role for Unifi on Raspbian
==================================

This role will install Ubiquiti's Unifi software on Raspberry Pi/Raspbian.

[![Molecule Test](https://github.com/tgagor/ansible-role-rpi_unifi/actions/workflows/test-and-release.yml/badge.svg)](https://github.com/tgagor/ansible-role-rpi_unifi/actions/workflows/test-and-release.yml)
[![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-tgagor-spofify.svg)](https://galaxy.ansible.com/tgagor/rpi_unifi)

## Supported systems

* Raspbian
  * 9 (stretch)
  * 10 (buster)
  * 11 (bullseye)

## Requirements

Unifi software requires `mongodb` package which is no longer provided on Bullseye, to get over that problem I'm installing package from Stretch repo.

## Role variables

Role doesn't require any custom variables.

## Dependencies

There are no dependencies on other roles.

## Example playbook

Just add to you playbook, to install it on `localhost`:

```yaml
- hosts: localhost
  connection: local
  gather_facts: true
  become: yes
  tasks:
    - name: Install Unifi
      include_role:
        name: tgagor.rpi_unifi
```

## License
-------

See [LICENSE](LICENSE)
