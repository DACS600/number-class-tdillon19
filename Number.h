#import <Foundation/Foundation.h>

@interface Number: NSObject
{
  int number;
}

-(void) terminalSpace;
-(void) setNumber: (int) num;
-(int) number;
-(void) print;
-(bool) isEven;
-(bool) isPrime;
-(bool) isPrimeSuper;
-(int) sumOfDigits: (int) num;
-(int) numberOfDigits;
-(int) largestDigit;
-(bool) isPerfectSquare;
-(int) nearestPerfectSquare;
-(int) absVal: (int) num;
-(void) displayPrimes;

@end
