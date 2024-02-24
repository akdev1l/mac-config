#!/bin/bash

####
#
# Bootstrap script to configure a Mac from scratch.
# Usage: curl https://raw.githubusercontent.com/akdev1l/mac-config/HEAD/bootstrap.sh | bash
#
####

echo "* Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" --unattended
export PATH="$PATH:/opt/homebrew/bin"

echo "* Installing ansible and git"
brew install ansible git

echo "*Cloning ansible playbooks"
mkdir -p "${playbook_dir}"
git clone https://github.com/akdev1l/mac-config.git "${playbook_dir}"
(
	cd "${playbook_dir}"
	echo "* Executing ansible playbooks"
	ansible-playbook -K main.yml
)
