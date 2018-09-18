// a program
#import <Foundation/Foundation.h>

#import "Number.h"

int main(int argc, const char *argv[]) {
  @autoreleasepool{
    //initialize myNumber
    Number *myNumber = [[Number alloc] init];
    int input;


    //infinite loop
    for(;;) {
    [myNumber terminalSpace];

    printf("Press control c to quit or enter your number below\n");
    scanf("%d", &input);

    //assigns a number to myNumber
    [myNumber setNumber: input];

    [myNumber print];

    //isEven
    if([myNumber isEven])
      printf("- is even\n");
    else
      printf("- is odd\n");

    //isPrime
    if([myNumber isPrime])
      printf("- is Prime\n");
    else
      printf("- is not Prime\n");

    //numberOfDigits
    printf("- has %i digits\n", [myNumber numberOfDigits]);

    //sumOfDigits
    printf("- sum of Digits is %i\n", [myNumber sumOfDigits: [myNumber number]]);

    //largestDigit
    printf("- largest Digit is %i\n", [myNumber largestDigit]);

    //isPerfectSquare
    if([myNumber isPerfectSquare])
      printf("- is a perfect square \n");
    else
      printf("- is not a perfect square \n");

    //nearestPerfectSquare
    printf("- nearest perfect square is %i\n", [myNumber nearestPerfectSquare]);

    [myNumber terminalSpace];

    }
  }
  return 0;
}
