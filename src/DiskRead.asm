PROGRAM_SPACE equ 0x7e00

ReadDisk:
	mov ah, 0x02
	mov bx, PROGRAM_SPACE
	mov al, 4
	mov dl, [BOOT_DISK]

	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	int 0x13

	jc DiskReadError


ret

BOOT_DISK:
	db 0

DiskReadError:
	push DiskReadErrorMsg
	call print
ret

DiskReadErrorMsg:
	db "Disk read failed!",0