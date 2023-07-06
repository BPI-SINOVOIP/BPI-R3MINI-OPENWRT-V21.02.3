KERNEL_LOADADDR := 0x48080000

define Device/BPI-R3MINI-EMMC
  DEVICE_VENDOR := Banana Pi
  DEVICE_MODEL := Banana Pi R3MINI
  DEVICE_TITLE := MTK7986a BPI R3MINI EMMC 
  DEVICE_DTS := mt7986a-bananapi-bpi-r3mini-emmc
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := bananapi,bpi-r3mini
  DEVICE_PACKAGES := mkf2fs e2fsprogs blkid blockdev losetup kmod-fs-ext4 \
		     kmod-mmc kmod-fs-f2fs kmod-fs-vfat kmod-nls-cp437 \
		     kmod-nls-iso8859-1
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += BPI-R3MINI-EMMC

define Device/BPI-R3MINI-NAND
  DEVICE_VENDOR := Banana Pi
  DEVICE_MODEL := Banana Pi R3MINI
  DEVICE_TITLE := MTK7986a BPI R3MINI NAND
  DEVICE_DTS := mt7986a-bananapi-bpi-r3mini-nand
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := bananapi,bpi-r3mini
  UBINIZE_OPTS := -E 5
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  IMAGE_SIZE := 65536k
  KERNEL_IN_UBI := 1
  IMAGES += factory.bin
  IMAGE/factory.bin := append-ubi | check-size $$$$(IMAGE_SIZE)
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += BPI-R3MINI-NAND
