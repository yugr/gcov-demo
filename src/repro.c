#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  switch (strtol(argv[1], NULL, 0)) {
    case 1:
      printf("In 1\n");
      break;
    case 2:
      printf("In 2\n");
      break;
  }
  return 0;
}
