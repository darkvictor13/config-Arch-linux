#include <stdio.h>

//const char* hosts = "/etc/hosts";
//const char* hostname = "/etc/hostname";
const char *hosts = "/home/victor/teste/hosts";
const char *hostname = "/home/victor/teste/hostname";

int entrada (char *nome) {
	char resp;
	printf("Por favor digite qual deve ser o nome do seu pc na rede\n");
	printf("Obs: O nome nao deve conter letras maiusculas nem espacos\n");
	printf("Nome: ");
	scanf("%[^\n]%*c", nome);
	printf("Voce confirma que seu nome eh = (%s) [Y/n] ", nome);
	scanf("%c", &resp);
	if (resp == 'n') return 0;
	return 1;
}

void criaHostName (char *nome) {
	FILE *arch = fopen(hostname, "w");
	if (arch == NULL){
		printf("Arquivo Invalido!\n");		
		return;
	}
	fprintf(arch,"%s\n", nome);
	fclose(arch);	
}

void criaHosts (char *nome) {
	FILE *arch = fopen(hosts, "w");
	if (arch == NULL){
		printf("Arquivo Invalido!\n");		
		return;
	}
	fprintf(arch, "127.0.0.1\t");
	fprintf(arch, "localhost.localdomain\t");
	fprintf(arch, "localhost\n");
	fprintf(arch, "::1\t\t");
	fprintf(arch, "localhost.localdomain\t");
	fprintf(arch, "localhost\n");
	fprintf(arch, "127.0.1.1\t");
	fprintf(arch, "%s.localdomain\t", nome);
	fprintf(arch, "%s\n", nome);
	fclose(arch);	
}

int main () {
	char nome[21];
	if (!entrada(nome)) return 0;
	criaHostName(nome);
	criaHosts(nome);
	printf("Arquivos escritos com sucesso!\n");
	return 0;
}
