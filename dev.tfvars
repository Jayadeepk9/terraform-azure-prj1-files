# Resource group name and location 
rgname = "prj1-dev-rg"
rgloc  = "west us"

# Virtual network name and address spaces 
v_net     = "prj1-dev-vmvnet"
add_space = ["10.0.0.0/16"]

# Subnet name and address preference
subnetname = "prj1-dev-subnet"
add_pref   = ["10.0.2.0/24"]

# Public ip name and allocation method
publicip_name = "prj1-dev-vmPublicIp1"
alloc_method  = "Static"

# NIC name , ip configuration , aloocation method
nic_name             = "prj1-dev-nic"
nic_ip_conf_name     = "internal"
private_ip_add_alloc = "Dynamic"

#NSG name , security rules
nsg_sec_name        = "prj1-dev-nsg"
nsg_nameforvm       = "rdp"
nsg_prority         = 100
nsg_dir             = "Inbound"
nsg_access          = "Allow"
nsg_protocol        = "Tcp"
nsg_sour_port_range = "*"
nsg_des_port_range  = "3389"
nsg_sour_add_pref   = "*"
nsg_des_add_pref    = "*"


# Windows Virtual machine name,size, username and password
win_VM          = "dev-VM"
win_VM_size     = "Standard_D2s_v3"
win_VM_username = "Devolper Vm1"
win_VM_pwd      = "Azure@12345"

# OS disk name and account type
os_disk       = "ReadWrite"
strg_acc_type = "Standard_LRS"

# Source image reference publisher,dku,offer and its version
sipublisher = "MicrosoftWindowsServer"
sioffer     = "WindowsServer"
sisku       = "2019-Datacenter"
siversion   = "latest" 