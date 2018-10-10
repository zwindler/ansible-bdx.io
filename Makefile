checkvar:
ifndef SCW_API_KEY
  $(error SCW_API_KEY is not set)
endif

init:
	export ANSIBLE_HOST_KEY_CHECKING=False
	mv /root/.ssh/known_hosts /root/.ssh/known_hosts.ori

clean: 
	rm scaleway/*.retry digitalocean/*.retry *.retry

generate: checkvar
	date
	ansible-playbook -i hosts scaleway/create_vms.yml
	date

inventory: checkvar 
	ansible-inventory --list -i scaleway/inventory.yml

scan: checkvar
	ansible-inventory --list -i scaleway/inventory.yml | jq -r '.bdxio.hosts | .[]' | xargs ssh-keyscan >> ~/.ssh/known_hosts

install:
	ansible-playbook -i scaleway/inventory.yml -l bdxio -u root install.yml

remove: checkvar
	date
	ansible-playbook -i hosts scaleway/remove_vms.yml
	date
