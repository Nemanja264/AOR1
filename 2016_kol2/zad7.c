#include <stdio.h>

int funkcija(short ulniz[], int n, short scalar) {
	_asm
	{
		mov ebx, ulniz // adr vrste matrice
		mov ecx,n // broj kolona
		xor esi,esi // za pomeraj kroz niz
		xor eax,eax // suma

		petlja:
		movzx edx,word ptr[ebx+esi]
		cmp edx,0 // dali je pozitivan
		jle dalje
		cmp dx,scalar // da li je veci od zadate vrednosti
		jle dalje
		add eax,edx // dodaj u sumu ako je veci
		dalje:

		add esi,2
		loop petlja
	}
}
void main() {
	short mat[100][100];
	int n, m;
	short niz[100];

	printf("Unesi dimenzije matrice:\n");
	scanf_s("%d", &n);
	scanf_s("%d", &m);

	printf("Unesite elemente matrice:\n");
	for (int i = 0; i < n; i++)
		for (int j = 0; j < m; j++)
			scanf_s("%hd", &mat[i][j]);

	/*printf("Matrica:\n");
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++)
			printf("%d ", &mat[i][j]);
		printf("\n");
	}*/
	
	for (int i = 0; i < n; i++) {
		niz[i] = funkcija(mat[i], m, mat[i][0]); // u eax je rez
	}
	printf("Niz: ");
	for (int i = 0; i < n; i++)
		printf("%d ", niz[i]);

}
