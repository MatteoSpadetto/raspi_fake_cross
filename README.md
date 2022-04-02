# raspi_fake_cross
Copying and compiling all C scripts from remote device to rasp (or other linux based os with ssh connection).

SSH/SCP/SSHPASS required.

This bash script is intended for coding on a Linux machine (on VScode or other IDE/text_editiors), copying and compiling all files on a second remote device in one automated shot.

To use it just use the structure shown in c_cross folder for ads1115 (just an easy example). If more folders are needed just copy the ads115 folder and change the name in each foleders/files.

The entire c_cross folder will be copied to the remote device, compiled and if request also run.
