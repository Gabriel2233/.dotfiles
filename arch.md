# Check Internet connection
`ip -c a`

# List keyboards

`localectl list-keymaps | grep br`
`loadkeys br-abnt`

# System Clock

`timedatectl set-ntp true`

# Partitions

## Create
`gdisk <DEVICE>`

```
n, code ef00 +500M (EFI partition)`
n, code 8200 +4G (Swap)`
n, default, root partition`

w
```

## Format

```
mkfs.fat -F 32 /dev/<EFI_DEVICE>

mkswap /dev/<SWAP_DEVICE>

mkfs.ext4 /dev/<ROOT_DEVICE>
```

# Mount the filesystems

```
mount /dev/<ROOT_DEVICE> /mnt

mkdir -p /mnt/boot/efi
mount /dev/<EFI_DEVICE> /mnt/boot/efi

swapon /dev/<SWAP_DEVICE>
```

# Install the base packages

`pacstrap /mnt base linux linux-firmware vim git networkmanager grub efibootmgr sudo`

# Generate fs tab

`genfstab -U /mnt >> /mnt/etc/fstab`
`arch-chroot /mnt`

# Base install

```
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
systemctl enable NetworkManager

useradd -m -G wheel -s /bin/bash gabriel
// run visudo and uncomment wheel line

passwd
passwd gabriel

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

exit

reboot
```

