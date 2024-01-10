.386
.model flat,c
.data
mat dword 12 dup(?)
n dword 3
niz dword 2,7,23,10,0

.stack 4096
.code
popuni proc
push ebp
mov ebp,esp
pushfd
pushad

mov eax,[ebp+8] ; adresa elementa niza
mov edx,[eax] ; element niza
mov edi,[ebp+12] ; adresa elementa matrice
mov [edi],edx ; element matrice

popad
popfd
pop ebp

ret ; skida sve ostalo sa steka
popuni endp

main proc
mov esi,0
mov edx,n
shl edx,2 ; korak za ebx
mov edi,0 ; za obilazak kroz niz



petlja:
mov eax,0 ; prolazak kroz kolonu
mov ebx,0 ; vrsta

unutrasnja:


lea ecx,mat[ebx][esi] ;adresa elementa matrice
push ecx
lea ecx,niz[edi] ; adresa elementa niza
push ecx
call popuni

cmp niz[edi],0 ; da vidimo da li smo dosli do kraja niza
je dole
add edi,4 ; ako nismo povecavamo adresu
jmp posle
dole:
mov edi,0 ; ako jesmo idemo na pocetak niza
posle:

add ebx,edx ; korak za ebx
inc eax
cmp eax,n
jb unutrasnja ; vrti po koloni

add esi,4 ; korak za esi // sledeca vrsta
cmp esi,edx
jb petlja ; vrti vrste

ret 8
main endp
end main
