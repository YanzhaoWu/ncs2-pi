sudo usermod -a -G users "$(whoami)"
source /home/pi/openvino_dist/bin/setupvars.sh
sh /home/pi/openvino_dist/install_dependencies/install_NCS_udev_rules.sh


