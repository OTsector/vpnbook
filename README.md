# VPNBOOK Connecter
## How to install:
	git clone https://github.com/OTsector/vpnbook.git /opt/vpnbook
	cd /opt/vpnbook
	sudo chmod +x vpnbook.sh
	sudo echo -e '#!/bin/bash\nbash /opt/vpnbook/vpnbook.sh\nexit 0' > /usr/bin/vpnbook
	sudo chmod +x /usr/bin/vpnbook
## One line command:
	git clone https://github.com/OTsector/vpnbook.git /opt/vpnbook && cd /opt/vpnbook && sudo chmod +x vpnbook.sh && echo -e '#!/bin/bash\nbash/opt/vpnbook/vpnbook.sh\nexit 0' > /usr/bin/vpnbook && sudo chmod +x /usr/bin/vpnbook
