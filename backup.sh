# Backup root

BKUP_LOC="/mnt/backup/axius"

rm -rf "$(BKUP_LOC)/backup.3"
mv "$(BKUP_LOC)/backup.2" "$(BKUP_LOC)/backup.3"
mv "$(BKUP_LOC)/backup.1" "$(BKUP_LOC)/backup.2"
mv "$(BKUP_LOC)/backup.0" "$(BKUP_LOC)/backup.1"

sudo rsync -aAXv --delete --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/nix/* --exclude="swapfile" --exclude="lost+found" --exclude="cache" --link-dest=$(BKUP_LOC)/backup.1 / $(BKUP_LOC)/backup.0

# Backup media

BKUP_LOC="/mnt/backup/media"

rm -rf "$(BKUP_LOC)/backup.3"
mv "$(BKUP_LOC)/backup.2" "$(BKUP_LOC)/backup.3"
mv "$(BKUP_LOC)/backup.1" "$(BKUP_LOC)/backup.2"
mv "$(BKUP_LOC)/backup.0" "$(BKUP_LOC)/backup.1"

sudo rsync -aAXv --delete --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude="swapfile" --exclude="lost+found" --exclude="cache" --link-dest=$(BKUP_LOC)/backup.1 /mnt/media $(BKUP_LOC)/backup.0

# Backup data

BKUP_LOC="/mnt/backup/data"

rm -rf "$(BKUP_LOC)/backup.3"
mv "$(BKUP_LOC)/backup.2" "$(BKUP_LOC)/backup.3"
mv "$(BKUP_LOC)/backup.1" "$(BKUP_LOC)/backup.2"
mv "$(BKUP_LOC)/backup.0" "$(BKUP_LOC)/backup.1"

sudo rsync -aAXv --delete --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude="swapfile" --exclude="lost+found" --exclude="cache" --link-dest=$(BKUP_LOC)/backup.1 /mnt/data $(BKUP_LOC)/backup.0
