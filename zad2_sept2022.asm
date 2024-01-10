.386
.model flat,c
.data
mat dword 20,4,2,6
	dword 100,8,9,12
	dword 20,11,14,13
	dword 60,6,8,8
n byte 4
rez byte ?
.stack 4096
.code
suma proc

push ebp
mov ebp,esp
pushfd
pushad

mov esi,[ebp+8] ; 2. el u vrsti matrice
mov eax,0 ; suma
mov cl,[ebp+12] ; brel niza
movzx ecx,cl

sumaNiza:

add eax,[esi] ; sumiranje

add esi,4 ; sledeci element niza
loop sumaNiza

mov [ebp+12], eax ; suma na dno steka

popad
popfd
pop ebp
ret 4
suma endp
main proc

mov ebx,0
mov esi,0
;mov eax,mat[ebx][esi]
movzx edx,n
shl edx,2 ; korak za ebx, 4n
mov cl,0
mov rez,cl ; za slucaj da nema takvih vrsti

petlja:

movzx edi,n
dec edi ; brel niza
push edi
lea edi, mat[ebx][4] ; adr niza, 2. el vrste matrice
push edi
call suma
pop eax
; u eax je suma

cmp mat[ebx],eax ; mat[ebx] prvi element vrste
ja dalje
mov rez,cl
inc rez ; upisujemo broj vrste jer je cl za 1 manje od broja vrste
jmp kraj
dalje:

add ebx,edx
inc cl
cmp cl, n
jb petlja

kraj:

ret
main endp
end main
