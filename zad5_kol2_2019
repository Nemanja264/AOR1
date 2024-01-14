.386
.model flat,c
.data
mat word 2,-3,-4,-5
	word 3,9,0,-9
	word 4,-8,8,8
	word 5,8,8,-8
n byte 4
rez byte ?
.code
main proc
xor ax,ax ; broj
mov ebx,0
mov dl,0 ; br pozivitnih 1. podmatrice
mov dh,0 ; br pozitivnih 2. podmatrice
movzx edi,n
shl edi,1 ; 2n
movzx ecx,n
shr ecx,1 ; n/2


prva:
mov esi,0

unutrasnja:
mov ax,mat[ebx][esi]
cmp ax,0
jle preskoci
inc dl ; br pozitivnih brojeva
preskoci:

add esi,2 ; sledeca kolona
cmp esi,edi
jb unutrasnja

add ebx,edi ; sl vrsta
loop prva

movzx ecx,n
shr ecx,1 ; n/2

druga:
mov esi,0

unutrasnja2:
mov ax,mat[ebx][esi] ; element matrice
cmp ax,0 ; ako je veci od nule
jle dalje
inc dh ; br pozitivnih brojeva
dalje:

add esi,2 ; sledeca kolona
cmp esi,edi
jb unutrasnja2

add ebx,edi ; sledeca vrsta
loop druga

cmp dh,dl
ja dva
cmp dh,dl
je jednako
mov rez,1 ; ako prva podmatrica ima vise pozitivnih brojeva
jmp kraj
jednako: ; ako imaju isti broj pozitivnih brojeva
mov rez,0
jmp kraj
dva: ; ako druga podmatrica ima vise pozitivnih brojeva
mov rez,2
kraj:

; rez = 0 // podmatrice imaju isti broj pozitivnih brojeva
; rez = 1 // prva podmatrica ima vise pozitivnih brojeva
; rez = 2 // druga podmatrica ima vise pozitivnih brojeva


ret
main endp
end main
