.386
.model flat,c
.stack 4096
.code
zameni proc
push ebp
mov ebp,esp
pushfd
push ecx
push ebx
push eax
push edx
push esi
push edi

mov ecx,[ebp+8] ; char n 
mov edi,[ebp+12] ; adr Z
mov eax,[edi] ; Z
mov edi,[ebp+16] ; adr X
mov edx,[edi] ; X
mov edi,[ebp+20] ; adr Y
mov ebx,[edi] ; Y
mov esi, [ebp+24] ; adr niza1


petlja:


cmp edx,[esi] ; X < niz[i]
jge dalje
cmp ebx,[esi] ; Y > niz[i]
jle dalje
mov [esi],eax ; niz[i] = Z
dalje:

add esi,4 ; niz[i++]
loop petlja

pop edi
pop esi
pop edx
pop eax
pop ebx
pop ecx
popfd
pop ebp

ret
zameni endp
end
