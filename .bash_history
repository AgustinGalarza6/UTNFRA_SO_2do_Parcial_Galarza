sudo fdisk -l
clear
ls
sudo apt update
sudo apt install ansible
ls
sudo apt list --installed | grep ansible
sudo apt list --installed | grep git
sudo apt list --installed | grep docker
ssh-keygen -t ed25519
pwd
ls -l
ls -la
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
sudo apt update
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
id
sudo usermod -a -G docker $(whoami)
exit
id
sudo systemctl status docker
sudo systemctl status apache2
ls
mkdir repogit
cd repogit/
git clone https://github.com/upszot/UTN-FRA_SO_Docker
sudo apt install apache2
sudo apt update
clear
ls -l
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
source ~/.bashrc
ls -l
cd UTN-FRA_SO_Examenes/
ls
./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
cd ..
clear
cd
cd ..
ls
cd vagrant/
ls
repogit/
cd repogit/
ls
rm -rf UTN-FRA_SO_Examenes/
ls
cd ..
ls
rm -rf RTA_Examen_20241118/
ls
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
./UTN-FRA_SO_Examenes/202406/script_Precondicion.sh
source ~/.bashrc
ls
cd RTA_Examen_20241118/
ls
git clone https://github.com/AgustinGalarza6/UTNFRA_SO_2do_Parcial_Galarza.git
ls -l
ls UTNFRA_SO_2do_Parcial_Galarza/
pwd
find / -type d -name "RTA_Examen_20241118"
clear
cp -r /home/vagrant/RTA_Examen_20241118 /home/vagrant/UTNFRA_SO_2do_Parcial_Galarza/
ls
UTNFRA_SO_2do_Parcial_Galarza/
cd UTNFRA_SO_2do_Parcial_Galarza/
ls
history -a
ls -la
ls -a ~
