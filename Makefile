checkvar:
ifndef SCW_API_KEY
  $(error SCW_API_KEY is not set)
endif

clean: 
	rm *.retry

generate: checkvar
	ansible-playbook -i hosts create_vms.yml

remove: checkvar
	ansible-playbook -i hosts remove_vms.yml
