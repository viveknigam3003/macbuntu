"""

***GUIDE TO INSTALL UBUNTU AND TROUBLESHOOTING IT ON GAMING LAPTOPS***

0. Always before Installation - Make the USB bootable with GPT : UEFI
Use only Ubuntu 16.04.5 as the Live Disk Image.

1. Disable Secure Boot in the Boot Menu, You can reach it by pressing F2 at time of start

2. REMEMBER: when at the GRUB where options to try, try and install and others appear
Press 'e' to enter the GRUB Settings and in the line with `quiet splash` add `acpi=off`
This is temporary and is needed until you do not install the nVidia drivers.

3. Choose `Something Else` at time of installation when asked to install alongside Windows etc.
Make three partitions out of the free space:

-----------------------------------
Format	Mount Point	Size		Remarks
EXT4	/			20GB		root
swap 				16GB		Swap Memory - Double of RAM Size
EXT4	/home		remaining	Home Directory - The remaining space to be alloted to it.
-----------------------------------

4. Install the BootLoader in the place where Windows BootLoader is installed. It is set by default.

5. Proceed with the installation normally.

6. Run the following commands after installation to setup the machine more accurately.
"""
#To Update the package manager.
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get clean
sudo apt-get update

#Install & Update the nVidia Graphics Driver
sudo apt-get install nvidia-384

#To Bring back the power indicator
sudo apt-get upgrade
sudo apt-get purge indicator-power
sudo apt-get install indicator-power
indicator-power
/usr/lib/x86_64-linux-gnu/indicator-power/indicator-power-service &disown

#To Make the Touchpad work open GRUB File using
#sudo nano /etc/default/grub
#Change the following line - 
#GRUB_CMDLINE_LINUX_DEFAULT="i8042.reset quiet splash"
#Save with ctrl+X and press Y then enter.
#sudo update-grub
#sudo shutdown -r now

#This will restart the system and things should work fine.

#To Install Python 3.6:
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt-get update
sudo apt-get install python3.6
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
sudo update-alternatives --config python3
python3 -V
sudo rm /usr/bin/python3
sudo ln -s python3.5 /usr/bin/python3

#To Install Docker-CE
sudo apt-get update
sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
docker version

#Start Docker-Service
sudo systemctl start docker
sudo systemctl enable docker

#Test Correct Installation of Docker
sudo docker run hello-world

#To Install GIT
sudo apt-get install git
git config --global user.email "viveknigam.nigam3@gmail.com"
git config --global user.name "viveknigam3003"

#If ever the Appearance Option or anything else dissapears then re-install
#Unity Desktop by
sudo apt-get install --reinstall ubuntu-desktop 
