# Development Guide

At this time the development process depends on the use of Podman (the new standard for local containerization). Contractors or other
employees without access to a container runtime will not be able to use this guide as a development
aid.

Guide on how to setup podman - [Podman Container Development](https://wiki.usaa.com/display/PI/Podman+Container+Development)

## Running the container

The recommended approach to running the container locally is with `podman-compose`.
```shell
$ podman-compose build
$ podman-compose up --no-build --force-recreate
```
The first command will prepare the image and the second will build the container, start it, and
begin an interactive terminal session (requires a container runtime to support v3 compose files).

See other sections below for common commands to be run while using the containers terminal.

To clean up the container(s) after testing and development is complete:
```shell
$ podman-compose down
```

## Ansible environment setup

Most of the Ansible configuration will come from the included `ansible.cfg` file. If you want to
temporarily or permanently override the values you can alter the file or use environment variables.

## Ansible extra variables

Extra variables will be required to be passed into the playbook during runtime. A json file will need
to be created and set in the root directory.

Example json file: [extra-vars.json](roles/extra_vars_validation/files/sample/extra-vars.json)

|Name  	                  |Required    |Default Value    |
|:------------------------|:----------:|:---------------:|
|snow_task                |Yes         |n\a              |
|tpm_uuid                 |Yes         |n\a              |
|quota_size               |Yes         |n\a              |
|quota_size_type          |Yes         |n\a              |
|tenant_name              |Yes         |n\a              |
|tenant_poc               |Yes         |n\a              |
|tenant_business_case     |Yes         |n\a              |
|tenant_federated_ad_group|Yes         |n\a              |
|tenant_env               |Yes         |n\a              |
|


## Local conjur credentials

For utilizing local conjur credentials with Conjur Ansible Collection, `conjur_dev_credentials.json` file 
will need to be created and placed at the root directory.

Example of `conjur_dev_credentials.json` file:
```json
{
    "LocalVault/Conjur_Sync/AD_CL_Account/localAccount": {
      "username": "testlocal",
      "password": "test1234"
    },
    "LocalVault/Conjur_Sync/AD_CL_Account/anotherAccount": {
      "username": "testanother",
      "password": "test1234"
    }
}
```

## Running playbooks

You can start running Ansible commands. 

Example command to test you are up and running:
```shell
$ ansible -m ping localhost
```

Example command to run ansible playbook:
```shell
$ make ansible_run
```

## Ansible testing

At this point only sanity tests are configured. To run the test suite run the following command:
```shell
$ make sanity
```

On the first run some additional libraries may need to be installed. Subsequent sanity test runs
will be faster.

### Command-line variables

For testing purposes you may want to provide or override some fixed variables. You can make
temporary changes to a file, possibly forgetting and commiting the change, but a better way to do
this is to pass command-line variables. Some examples are:
```shell
(venv) $ ansible-playbook playbooks/account_retrieval.yml --extra-vars "@secrets.json"

(venv) $ ansible-playbook playbooks/account_retrieval.yml --extra-vars '{"other_variable":"foo"}'
```

## AWX controller configuration
The deployment of the project's AWX configurations are performed via gitlab ci pipeline, `.gitlab-ci.yml`. As a requirement 
for the AWX deployment, `controller_configurations.yml` needs to be created under the `awx/` directory. These configurations 
will build AWX credentials, project, inventories, schedules, job templates, workflow job templates, etc...

Example of `controller_configurations.yml` file: [controller_configurations.yml](awx/controller_configurations.yml)

* [redhat-cop/controller_configuration -- GitHub](https://github.com/redhat-cop/controller_configuration) 


## References

* [Developing modules -- Ansible Documentation](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_general.html)
* [Conventions, tips, and pitfalls -- Ansible Documentation](https://docs.ansible.com/ansible/latest/dev_guide/developing_modules_best_practices.html)

