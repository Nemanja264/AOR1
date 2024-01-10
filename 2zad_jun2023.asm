.386
.model flat,c
.data
mat dword 1,1,1,9
	dword 1,1,4,20
	dword 1,2,5,7
	dword 10,1,1,1
n dword 4
sortniz dword 10 dup(?)

.stack 4096
.code
sort proc
push ebp
mov ebp,esp
pushfd
pushad

mov esi,[ebp+12] ; adresa niz
mov ecx,[ebp+8] ; n
dec ecx

petlja:
mov ebx,ecx ; j=i
mov edi,4 ; i+1

unutrasnja:
mov eax,[esi] ; niz[i]
cmp eax,[esi+edi] ; niz[i]==niz[i+j]
jle dole ; ako je veci zameni
mov edx,[esi+edi] ; niz[i+j]
mov [esi+edi],eax ; niz[i]->niz[i+j]
mov [esi],edx ; niz[i]<-niz[i+j]
dole:

add edi,4
dec ebx
cmp ebx,0
ja unutrasnja


add esi,4
loop petlja

popad
popfd
pop ebp

ret 8
sort endp

main proc
xor ebx,ebx ; prolaz kroz sortniz
mov esi,n
shl esi,2 ; korak za esi 4*n
sub esi,4 ; 4*n-4
mov edx,esi ; skok na sledeci element sporedne dijagonale // 12 u ovom slucaju

mov ecx,n
spoljasnja:
mov eax,mat[esi] ; element sporedne dijagonale
mov sortniz[ebx], eax ; smestamo elemente sporedne dijagonale u niz

add ebx,4 ; sledece mesto u nizu
add esi,edx ; sledeci element na sporednoj dijagonali matrice
loop spoljasnja

lea edi,sortniz
push edi
mov edi, n
push edi
call sort ; sortira

mov esi,edx ; restartujemo na prvi element sporedne dijagonale
mov ecx,n
xor edi,edi ; setanje kroz niz
raspodela:
mov eax,sortniz[edi]
mov mat[esi],eax ; smestamo sortirano u sporednu dijagonalu

add edi,4 ; sledeci element niza
add esi,edx ; sledece mesto na sporednoj dijagonali
loop raspodela


ret
main endp
end main
