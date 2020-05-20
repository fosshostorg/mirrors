# mirrors-ansible

ansible playbooks to manage fosshost software mirrors

configures the following mirrors:

- with [manjaro](https://manjaro.org) mirrors

this playbook expects debian hosts.

make sure your ssh key is on the hosts and run the playbook:

    ansible-playbook -i hosts site.yml

