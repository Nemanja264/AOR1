.386
.model flat,c
.data
mat dword 10,3,12,14
	dword 1,2,3,4
	dword 8,7,6,5
	dword 8,9,4,17
n dword 4
niz dword ?

.stack 4096
.code

max proc
push ebp
mov ebp,esp
pushfd
pushad

mov esi,[ebp+8] ; adresa vrste
mov ecx,[ebp+12] ; broj elemenata u vrsti
mov ebx,[esi] ; maxel
dec ecx ; n-1 broj prolazaka kroz petlju
add esi,4 ; drugi element vrste

maxel:
cmp ebx,[esi]
jae dalje
mov ebx,[esi] ; maxel
dalje:

add esi,4
loop maxel

mov [ebp+12],ebx ; smestamo maxel na dno steka

popad
popfd
pop ebp

ret 4
max endp

main proc
mov ebx,0
mov ecx,n ; broj prolazaka kroz petlju
mov edx,n
shl edx,2 ; 4n korak za ebx
mov esi,0 ; za prolazak kroz niz

petlja:

mov edi,n
push edi
lea edi,mat[ebx][0] ; adr prvog el vrste
push edi
call max

pop eax ; maxel
mov niz[esi],eax ; smestamo maxel vrste u niz

add esi,4
add ebx,edx
loop petlja


ret
main endp
end main
