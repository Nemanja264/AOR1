.386
.model flat,c
.data
niz dword 4,6,11,22,8,14,0,2,' ',19,20
zbir dword ?
brel byte 11

.code
main PROC

mov edx,0 ; suma
lea eax,niz ; adresa niza
mov cl,brel
movzx ecx,cl

spoljasnja:
mov ebx,[eax]

cmp ebx,0
jne dalje
suma:
add edx,[eax]
add eax,4
loop suma
mov zbir,edx
mov ecx,1
dalje:

add eax,4
loop spoljasnja

ret
main endp
end main
