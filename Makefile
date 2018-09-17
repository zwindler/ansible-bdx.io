checkvar:
ifndef SCW_API_KEY
  $(error SCW_API_KEY is not set)
endif

clean: 
	rm scaleway/*.retry digitalocean/*.retry

generate: checkvar
	date
	ansible-playbook -i hosts scaleway/create_vms.yml
	date

remove: checkvar
	date
	ansible-playbook -i hosts scaleway/remove_vms.yml
	date

inventory: 
	ansible-inventory --list -i scaleway/inventory.yml

scan: 
	ansible-inventory --list -i scaleway/inventory.yml | jq -r '.bdxio.hosts | .[]' | xargs ssh-keyscan >> ~/.ssh/known_hosts

install:
	ansible-playbook -i 
