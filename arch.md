# Check Internet connection
`ip -c a`

# List keyboards

`localectl list-keymaps | grep br`
`loadkeys br-abnt2`

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

