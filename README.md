# VPNBOOK Client
## How to install:
	git clone https://github.com/OTsector/vpnbook.git /opt/vpnbook
	cd /opt/vpnbook
	sudo chmod +x vpnbook.sh
	sudo echo -e '#!/bin/bash\ncd /opt/vpnbook/ && bash vpnbook.sh\nexit 0' > /usr/bin/vpnbook
	sudo chmod +x /usr/bin/vpnbook
## One line command:
	git clone https://github.com/OTsector/vpnbook.git /opt/vpnbook && sudo chmod +x /opt/vpnbook/vpnbook.sh && sudo ln -fs /opt/vpnbook/vpnbook.sh /usr/bin/vpnbook
## How to run:
	sudo vpnbook
