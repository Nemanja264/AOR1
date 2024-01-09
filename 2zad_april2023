.386
.model flat,c
.data
mat word 2,11,4,3
	word 6,13,12,1
	word 8,15,9,6
	word 10,17,14,8
n word 4

.stack 4096
.code
prosek proc
push ebp
mov ebp,esp
pushfd
pushad

mov cx,[ebp+12] ; n
movzx ecx,cx
mov esi,[ebp+8] ; mat[ebx][esi]
mov eax,0 ;suma
movzx edx,n
shl edx,1 ; za sledeci element vrste, jer je matrica smestena po kolonama

suma:
add ax,[esi] ; sumiranje
add esi,edx ; prelazak na sledeci element vrste u ovom slucaju // odnosno element niza
loop suma
movzx eax,ax ; prosirujemo ax
mov edx,0 ; cistimo edx

mov di,[ebp+12] ; n
movzx edi,di
div edi ; prosek
mov [ebp+12], eax ; smestamo prosek na dno steka

popad
popfd
pop ebp

ret 4
prosek endp

main proc
mov esi,0
movzx edi,n
shl edi,1 ; korak za ebx 2n
movzx ecx,n ; broj prolazaka kroz spoljasnju petlju

;PROLAZAK PO VRSTI
spoljasnja:
mov ebx,0 ; pocetak vrste

movzx edx,n
push edx
lea edx,mat[ebx][esi] ; adr vrste matrice
push edx
call prosek
mov edx,0
pop eax ; prosek

unutrasnja:

cmp ax,mat[ebx][esi] ; prosek i element matrice
jae dalje ; ako element matrice nije veci od prosek idemo na sledeci element
mov mat[ebx][esi],ax ; u slucaju da je element matrice veci od proseka menjamo element sa prosekom
dalje:

add ebx,edi ; sledeca kolona
inc dx
cmp dx,n ; broj prolazaka kroz unutrasnju petlju
jb unutrasnja

add esi,2 ; sledeca vrsta
loop spoljasnja

ret
main endp
end main
