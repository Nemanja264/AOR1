.386
.model flat,c
.stack 4096
.code
prebaci proc
; na dnu je adresa niza
; iznad adrese niza je dim2
; iznad dim2 je dim1 
; iznad dim1 je adresa matrice
push ebp
mov ebp,esp
pushfd
push ecx
push esi
push ebx
push edx

mov ecx,[ebp+12] ; dim2
mov ebx,[ebp+8] ; adresa matrice
mov esi,[ebp+16] ; adresa niza

xor eax,eax

spoljasnja:

movsx edx,word ptr[ebx]
cmp edx,0
jge dalje
; ako je negativan broj
mov [esi],edx ; smestimo negativan broj u niz
inc eax ; brel niza
add esi,2; idemo na sledeci element u nizu
dalje:

add ebx,2 ; sl element matrice
loop spoljasnja

pop edx
pop ebx
pop esi
pop ecx
popfd
pop ebp

ret
prebaci endp
end
