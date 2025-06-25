infra:
	git pull
	terraform init
	terraform apply -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_name)-internal.mikeydevops1.online, setup-tool.yml -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=$(tool_name)
	#ansible-playbook -i $(tool_name).mikeydevops1.online, setup-tool.yml -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=$(tool_name)

secrets:
	git pull
	cd misc/vault
	make vault_token=${vault_token}