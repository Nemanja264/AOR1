.386
.model flat,c
.data
mat word 4,9,4,2
	word 7,7,6,8
	word 2,10,12,20
n word 4
m word 3
brel byte 0
.code
main proc
movzx esi,n
shl esi,1
sub esi,4 ; 2n-4
movzx ebx,n
shl ebx,1 ; 2n

mov ax,mat[ebx][esi] ; drugi element pretposlednje vrste matrice

mov esi,0
movzx edi,n
shl edi,1 ; korak za ebx
movzx ecx,n

spoljasnja:
mov ebx,0
mov dx,0

unutrasnja:
cmp ax,mat[ebx][esi] ; drugi element pretposlednje vrste < element matrice
jae dalje
inc brel ; broji koliko elemenata je vece od  drugog elementa pretposlednje vrste
dalje:

add ebx,edi ; sledeca kolona
inc dx
cmp dx,m
jb unutrasnja

add esi,2 ; sledeca vrsta
loop spoljasnja

ret
main endp
end main
