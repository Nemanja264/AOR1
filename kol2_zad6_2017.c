#include <stdio.h>

unsigned int bcdtoi(const char* niz, const unsigned int n) {
	_asm
	{
		mov esi, niz // adr niza
		mov ecx, n // brel niza
		xor eax,eax
		xor edi, edi // za carry
		mov ebx,1

		petlja:
		cmp [esi],10
		jae lose

		movzx eax,byte ptr [esi]
		mul ebx // cifra * stepen
		cmp edx,0 // ako je rez u edx otisao znaci da je vece od 32b
		jne lose
		add edi,eax // dobijanje broja // ako zbir da carry znaci da ne moze da stane u 32b
		jc lose 
		xor edx,edx // zbog mnozenja

		mov eax,ebx
		mov ebx,10
		mul ebx
		xor edx,edx // cistimo zbog mnozenja
		mov ebx,eax
		inc esi // sledeci element u nizu
		loop petlja

		mov eax,edi // rez fje u eax
		jmp kraj
			lose:
			mov eax,0
			jmp kraj
			kraj:
	}
}

void main() {
	char niz[100];
	int n;
	printf("Unesite broj elemenata niza: ");
	scanf_s("%d", & n);

	printf("Unesite elemente niza:\n");
	for (int i = 0; i < n; i++)
		scanf_s("%d", &niz[i]);

	unsigned int broj = bcdtoi(niz, n);

	printf("Broj %u", broj);
}
