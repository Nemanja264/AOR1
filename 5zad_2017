.386
.model flat,c
.data
mat word 1, 2, 3, 5, 6
	word 4, 4, 6, 7, 8
	word 7, 8, 5, 3, 2
	word 7, 8, 5, 2, 2
	word 7, 8, 5, 3, 3
n byte 5
.code
main PROC
mov ebx,0 ; kolone
mov esi,0 ; vrste
mov al,n
movzx eax,al
sub eax,1
mul n
shl eax,1
; max element ebx 2n(n-1)

mov edi,eax ; poslednja vrsta
movzx eax,n
shl eax,1
sub eax,2 ; poslednja kolona
mov ebp,eax 

mov dl,n
movzx edx,dl
shl edx,1 ; korak za vrstu 2n
movzx ecx,n
shr ecx,1 ; n/2 broj prolazaka kroz petlju
mov eax,0

petlja:
mov ax,mat[ebx][esi] ; pocetak
cmp ax,mat[edi][ebp] ; poredimo elemente podjednako udaljene od centralnog elementa
jbe dalje
movzx eax,ax
push eax ; pocetak
mov ax,mat[edi][ebp]
mov mat[ebx][esi],ax ; kraj u pocetak
pop eax
mov mat[edi][ebp],ax ; pocetak u kraj
dalje:

sub edi,edx ; smanjujemo vrstu
sub ebp,2 ; smanjujemo kolonu
add ebx,edx ; povecavamo vrstu
add esi,2 ; povecavamo kolonu

loop petlja



%ret
main endp 
end main
