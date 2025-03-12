galaxy = ansible-galaxy
current_dir = $(shell pwd)
COLLECTION_NAME=$(shell grep "name:" galaxy.yml | sed 's/ //g' | cut -d':' -f2)
COLLECTION_NAMESPACE=$(shell grep "namespace:" galaxy.yml | sed 's/ //g' | cut -d':' -f2)
COLLECTION_VERSION=$(shell grep "version:" galaxy.yml | sed 's/ //g' | cut -d':' -f2)
COLLECTION_TGZ=$(shell echo $(COLLECTION_NAMESPACE)-$(COLLECTION_NAME)-$(COLLECTION_VERSION).tar.gz)
ANSIBLE_CONFIG_DIR = $(shell echo $$HOME/ansible.cfg)
# ANSIBLE_PLAYBOOK_DIR = playbooks/eos_awx_testing.yml
# ANSIBLE_INVENTORY_DIR = environment/local/inventory.yml
PIP=python -m pip

# Basically a list of anything going into the collection tarball
DEPS=$(shell find plugins roles tests requirements.txt LICENSE)

# Default options (if not specified in CLI)
SANITY_TEST_OPT?=--skip-test pylint --skip-test shebang

clean:
	rm -rf $(extcoll_path) wheelhouse/* $(shell echo *-$(COLLECTION_VERSION).tar.gz)

# Using 'build' as an alias
build: $(COLLECTION_TGZ)

# Tarball will only be rebuilt if any DEPS are newer than COLLECTION_TGZ
$(COLLECTION_TGZ): $(DEPS) galaxy.yml
	$(galaxy) -vvvvvv collection build -f --output-path .

# ADD if collections- file exists
reqs:
	$(galaxy) collection install -r collections/requirements.yml -f -p $(GALAXY_DIR) || true

install: reqs build
	$(galaxy) collection install $(shell echo ./*-$(COLLECTION_VERSION).tar.gz) -f -p $(GALAXY_DIR)

# Install shouldn't be needed if paths are correctly setup
ansible_run:
	ANSIBLE_CONFIG=$(ANSIBLE_CONFIG_DIR) \
	ansible-playbook $() -i $(ANSIBLE_INVENTORY_DIR) -e '$(shell jq -c . extra-vars.json)'


########################################################
# NWLAB
########################################################

##### BUILD

.PHONY: build-wan-test
build-wan-test: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/review/WAN/inventory/inventory.yml -e "target_hosts=WAN"

.PHONY: build-dc-atl
build-dc-atl: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/prod/ONENET/inventory.yml -e "target_hosts=ATL_PE"

.PHONY: build-ro-ptx
build-ro-ptx: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/prod/RO/inventory.yml -e "target_hosts=RO"

.PHONY: build-onenet-review
build-onenet-review: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/review/ONENET_TEST/inventory.yml -e "target_hosts=FABRIC"

.PHONY: build-onenet-test
build-onenet-test: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/test/ONENET_TEST/inventory.yml -e "target_hosts=FABRIC" --ask-vault-pass

.PHONY: build-onenet-test-cmp
build-onenet-test-cmp: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/test/ONENET/inventory.yml -e "target_hosts=FABRIC" --ask-vault-pass

.PHONY: build-onenet-review-cmp
build-onenet-review-cmp: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/review/CMP_PROD/inventory.yml -e "target_hosts=FABRIC" --ask-vault-pass

# FIXME: This one for Plano
.PHONY: build-onenet-prod-cmp
build-onenet-prod-cmp: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/prod/CMP_PROD/inventory.yml -e "target_hosts=RO" --ask-vault-pass

.PHONY: build-nwlab-awe
build-nwlab-awe: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/local/AWE_TEST/inventory.yml -e "target_hosts=AWE"

.PHONY: deploy_exporter_onenet_test
deploy_exporter_onenet_test: # build nwlab prod
	ansible-playbook playbooks/pb.deploy_exporter.yml -i environment/local/ONENET_TEST/inventory.yml -e "target_hosts=RNAP1_PE_ROUTERS" -k



.PHONY: build-onenet-campus-local
build-onenet-campus-local: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/local/ONENET_TEST/inventory.yml -e "target_hosts=CMP1"

.PHONY: build-onenet-campus-review
build-onenet-campus-review: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/review/ONENET_TEST/inventory.yml -e "target_hosts=CMP1" --ask-vault-pass

.PHONY: build-onenet-dc-review
build-onenet-dc-review: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/review/ONENET_TEST/inventory.yml -e "target_hosts=DC1_PE_ROUTERS" --ask-vault-pass

.PHONY: build-onenet
build-onenet: # build nwlab prod
	ansible-playbook playbooks/pb.build.yml -i environment/local/ONENET/inventory.yml -e "target_hosts=RNAP"

.PHONY: build-iad
build-iad: # build deploy nwlab test
	ansible-playbook playbooks/pb.build.yml -i environment/local/NWLAB_WAN/IAD_TEST/inventory.yml -e "target_hosts=FABRIC"

.PHONY: docs-nwlab-wan-1net
docs-nwlab-wan-1net: # build nwlab prod
	ansible-playbook playbooks/pb.box_upload.yml -i environment/local/NWLAB_WAN/ONENET_TEST/inventory.yml

.PHONY: build-example-isis-ldp
build-example-isis-ldp: # build nwlab prod
	ansible-playbook examples/isis-ldp-ipvpn/build.yml -i examples/isis-ldp-ipvpn/inventory.yml



# .PHONY: build-nwlab-prod-psc3
# build-nwlab-prod-psc3: # build nwlab prod
# 	ansible-playbook playbooks/pb.build.yml -i sites/NWLAB_WAN/PROD/inventory.yml -e "target_hosts=PSC3C01"

# .PHONY: build-nwlab-prod-psc4
# build-nwlab-prod-psc4: # build nwlab prod
# 	ansible-playbook playbooks/pb.build.yml -i sites/NWLAB_WAN/PROD/inventory.yml -e "target_hosts=PSC4C01"

# .PHONY: build-nwlab-enclave
# build-nwlab-enclave: # build nwlab enclave
# 	ansible-playbook playbooks/pb.build.yml -i sites/NWLAB_WAN/ENCLAVE/inventory.yml -e "target_hosts=NWLAB_ENCLAVE_FABRIC"

##### VALIDATE
.PHONY: validate-nwlab-wan-atl
validate-nwlab-wan-atl: # build nwlab prod
	ansible-playbook playbooks/pb.anta_validate.yml -i sites/NWLAB_WAN/ONENET_TEST/inventory.yml -e "target_hosts=PROD_FABRIC" -k


##### DEPLOY 

# .PHONY: deploy-nwlab-mgmt
# deploy-nwlab-mgmt: # deploy nwlab mgmt
# 	ansible-playbook playbooks/pb.deploy.yml -i sites/NWLAB_WAN/MGMT/inventory.yml -e "target_hosts=NWLAB_MGMT_FABRIC"

# .PHONY: deploy-nwlab-test
# deploy-nwlab-test: # deploy nwlab test
# 	ansible-playbook playbooks/pb.deploy.yml -i sites/NWLAB_WAN/TEST/inventory.yml -e "target_hosts=NWLAB_TEST_FABRIC"

# .PHONY: deploy-nwlab-prod
# deploy-nwlab-prod: # deploy nwlab prod
# 	ansible-playbook playbooks/pb.deploy.yml -i sites/NWLAB_WAN/PROD/inventory.yml -e "target_hosts=NWLAB_PROD_FABRIC"

# .PHONY: deploy-nwlab-enclave
# deploy-nwlab-enclave: # deploy nwlab prod
# 	ansible-playbook playbooks/pb.deploy.yml -i sites/NWLAB_WAN/ENCLAVE/inventory.yml -e "target_hosts=NWLAB_ENCLAVE_FABRIC"

.PHONY: deploy-nwlab-prod-cvp
deploy-nwlab-prod-cvp: # deploy nwlab prod cvp
	ansible-playbook playbooks/pb.cvp_deploy.yml -i sites/NWLAB_WAN/PROD/inventory.yml -e "target_hosts=PROD_FABRIC host_filter=nwlab-psc4c01" -k

# FIXME: This one for Plano
.PHONY: deploy-onenet-prod-cmp
deploy-onenet-prod-cmp: # deploy nwlab prod cvp
	ansible-playbook playbooks/pb.cvp_deploy.yml -i environment/prod/CMP_PROD/inventory.yml -e "target_hosts=RO host_filter=dfw-trx1-ptx" --ask-vault-pass

# deploy-nwlab-prod-az1-cvp: # deploy nwlab prod cvp
# 	ansible-playbook playbooks/pb.cvp_deploy.yml -i sites/NWLAB_WAN/PROD/inventory.yml -e "target_hosts=PROD_FABRIC host_filter=nwlab-psc3c01" -k

# deploy-nwlab-prod-az2-cvp: # deploy nwlab prod cvp
# 	ansible-playbook playbooks/pb.cvp_deploy.yml -i sites/NWLAB_WAN/PROD/inventory.yml -e "target_hosts=PROD_FABRIC host_filter=nwlab-psc4c01" -k

# .PHONY: deploy-nwlab-prod-cvaas
# deploy-nwlab-prod-cvaas: # deploy nwlab prod cvaas
# 	ansible-playbook playbooks/pb.cvaas_deploy.yml -i sites/NWLAB_WAN/PROD/inventory.yml -e "target_hosts=PROD_FABRIC host_filter=nwlab-psc4c01"

########################################################
# ATL
########################################################

sanity:
	/usaa/pre-build.sh &&\
	$(PIP) install --user --upgrade pip &&\
	ansible-test sanity --exclude *.sh $(SANITY_TEST_OPT) -v;
	/usaa/post-build.sh

venvsetup:
	/usaa/pre-build.sh &&\
	$(PIP) install --upgrade pip --user &&\
	find . $$HOME -name requirements.txt -exec $(PIP) install --upgrade --user -r {} \;
	/usaa/post-build.sh

localclean:
	rm -f $(COLLECTION_TGZ)
	rm -f ansible.log

deep_clean:
	rm -rf $$HOME/ansible_collections
	rm -rf $$HOME/ansible_galaxy
	@echo "Collections and Galaxy artifacts cleaned. Rerun of setup scripts will be required."
	shopt -s dotglob && \
	rm -rf /mnt/podman-volume/* ; \
	shopt -u dotglob ;
	@echo "Volume cleaned. Rerun of setup scripts will be required."

help:
	@echo "Run 'Make install' to build Ansible Collections"
	@echo "Run 'Make venvsetup' to install python dependencies for the collections"
	@echo "Run 'Make sanity' to run a full suite of tests against the project"
	@echo "Run 'Make run_installed' to run the playbook locally"
	@echo "Run 'Make deep_clean' to drop all data in volume mount and project artifacts"
