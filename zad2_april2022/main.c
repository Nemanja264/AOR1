#include <stdio.h>

extern int prebaci(short matrica[100], int dim2 ,short niz[100]);

int main() {
	int dim1, dim2;
	short mat[100][100];
	short niz[100];
	printf("Unesi dimenzije matrice");
	scanf_s("%d", &dim1);
	scanf_s("%d", &dim2);
	printf("\nUnesi elemente matrice: ");

	
	for (int i = 0; i < dim1; i++)
		for (int j = 0; j < dim2; j++)
			scanf_s("%hd", &mat[i][j]); // mora short zbog hd jer radimo sa registrima tj sa hd brojevima
	
	int x = 0; // da brojimo koliko elemenata ima niz
	for (int i = 0; i < dim1; i++)
		x += prebaci(mat[i], dim2, (niz+x)); // mora nova vrsta matrice svaki put da se ubaci jer se cela matrica ne racuna kao niz

	printf("Matrica:\n");
	for (int i = 0; i < dim1; i++) {
		for (int j = 0; j < dim2; j++) {
			printf("%hd ", mat[i][j]);
		}
		printf("\n");
	}

	printf("\nNiz: ");
	for (int i = 0; i < x; i++)
		printf("%hd ", niz[i]);

}
