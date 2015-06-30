# Replace this script to your update configuration.
#
# In this case the system will update repositories, upgrades packages,
# and remove unused packages.

sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt-get dist-upgrade -y && \
sudo apt-get autoremove -y
