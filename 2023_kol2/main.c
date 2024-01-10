#include <stdio.h>

extern void zameni(char brel, int Z, int X, int Y, int niz[20]);

void main() {
	int n;
	int niz[20];
	int A;
	printf("Unesi broj elemenata niza: ");
	scanf_s("%d", &n);

	printf("Unesi elemenate niza:\n");
	for(int i=0;i<n;i++)
		scanf_s("%d", &niz[i]);

	printf("Unesi A: ");
	scanf_s("%d", &A);

	printf("Niz pre: ");
	for (int i = 0; i < n; i++)
		printf("%d ", niz[i]);

	zameni((char)n, &A, &niz[0], &niz[n-1], niz);

	printf("\nNiz posle: ");
	for (int i = 0; i < n; i++)
		printf("%d ", niz[i]);


}
