#import "Number.h"

@implementation Number

//constructor
-(id) init
{
  self = [super init];

  if(self)
  {
    //default value
    number = 1;
  }
  return self;
}

//array if all previosly recorded primes
NSMutableArray *listOfPrimes = nil;
//needs to be instantiated first at run time
+(void)initializeListOfPrimes {
  if(!listOfPrimes)
    listOfPrimes = [[NSMutableArray alloc] init];
    [listOfPrimes addObject:[NSNumber numberWithInteger:2]];
}

//Methods

/*
  lists primes in array
*/
-(void) displayPrimes
{
  for(int i = 0; i < 3; i++) {
    printf("Primes: %ld\n", [[listOfPrimes objectAtIndex:i] integerValue]);
  }
}

/*
  setNumber takes int num and assigns it to the instance variable number
*/
-(void) setNumber: (int) num
{
  number = num;
}

/*
  number returns the instance variable number
*/
-(int) number
{
  return number;
}

/*
  print displays the instance variable number in the terminal
*/
-(void) print
{
  printf("\n\nYour number: %i\n", number);
}

/*
  isEven is a boolean method which returns YES if the instance variable number
  is even and NO if not even
*/
-(bool) isEven
{
  return !(number%2);
}

/*
  isPrime is a boolean method which returns YES if the instance variable number
  is a prime number (only evenly divisible by itself and 1) and NO if not a
  a prime number (evenly divisbible by a number other than itself or 1)
*/
-(bool) isPrime
{
    NSDate *start = [NSDate date];

  for(int i = number-1; i > 1; i--) {
    if(!(number % i))
      return NO;
    }

    NSDate *stop = [NSDate date];
    NSTimeInterval runTime = [stop timeIntervalSinceDate:start];
  //  NSLog(@"executionTime = %f\n", runTime);

  return YES;
}

  //more than 2x more efficient than isPrime
-(bool) isPrimeSuper
{
  NSNumber *mynum =[[NSNumber alloc] initWithInt:number];
  //listOfPrimes initially includes 2, so in the next line all evens are removed
  if([listOfPrimes containsObject:mynum])
    return YES;

  NSDate *start = [NSDate date];
  //prime numbers must be greater than 1 and odd
  if(number < 1 || number%2 == 0)
  return NO;

  /*
  for loop begins by checking the first possible odd value less than number
  and decreases by 2 (to skip over even numbers) until the value is <= 1 (since
  any value less than or equal to 1 voids the prime definition)
  */
  for(int i = number-2; i >2; i-=2) {
    if(!(number % i))
      return NO;
    }
  NSDate *stop = [NSDate date];
  NSTimeInterval runTime = [stop timeIntervalSinceDate:start];
//  NSLog(@"executionTime = %f\n", runTime);

  [listOfPrimes addObject: [NSNumber numberWithInteger:number]];
  return YES;
}

/*
  numberOfDigits returns int count, the number of digits within number
*/
-(int) numberOfDigits
{

  if(!number)
    return 1;

  int count = 0;
  int num = number;

  // !=0 is a better option than > 0 because it can handle both +- numbers
  while(num) {
    num /= 10;
    count ++;
  }

  return count;

}

/*
  sumOfDigits returns int sum, the sum of number's digits
*/
-(int) sumOfDigits: (int) num
{
  /*
    Since a number is the sum of each digit's place's value, I decided to always
    include the value sign (+,-) when calculating each digit for this method
    and all others.
  */
  // int sum = 0;
  // int num = number;
  //
  // while(num)
  // {
  //   sum += num % 10;
  //   num /= 10;
  // }
  //
  // return sum;


  //recursive option
  if(!num)
    return 0;
  else
    return num%10 + [self sumOfDigits:num/10];
}

/*
  largestDigit returns int largest, the largest digit of number
*/
-(int) largestDigit
{
  /*
  largestDig will always be replaced, unless number is 0, in which case
  its largestDigit is already assigned.
  */
  int largest = 0;


  int num = number;

  while(num)
  {
    //need to apply absolute value to num%10
    if([self absVal:num%10] > [self absVal:largest])
      largest = num % 10;

    num/=10;
  }
  return largest;
}

/*
  isPerfectSquare returns YES if number is a perfect square and NO if not
*/
-(bool) isPerfectSquare
{
  //perfect squares cannot be negative
  if(number < 0)
    return NO;

  int square = 0;

  //checks all possible squares less than number
  while(square*square <= number) {
    if(square*square == number)
      return YES;
    square++;
  }
  return NO;
}

/*
  nearestPerfectSquare returns the nearest perfect square to number. It uses
  a while loop to check all perfect squares until the difference of
  the current square is greater than the difference of the previous square.
  That square is then returned.
*/
-(int) nearestPerfectSquare
{
  //the nearest perfect square of any negative number or of 0 is 0
  if(number <= 0)
    return 0;

  NSDate *start = [NSDate date];



  int diff = number;

  int square = 0;

  //checks to see if the next square is valid before actually increasing square
  while(diff > [self absVal:(number - pow(square+1,2))]) {
    diff = [self absVal: number - (square+1)*(square+1)];
    square++;
  }
  NSDate *stop = [NSDate date];
  NSTimeInterval runTime = [stop timeIntervalSinceDate:start];
  //(efficiency plunges as number grow bigger nad bigger)
//  NSLog(@"executionTime = %f\n", runTime);
  return square*square;
}
  /*
    nearestPerfectSquareSuper finds the square root of number
    and then casts (int) onto the float square after square has been rounded. Then
    the nearest square is returned.
  */

-(int) nearestPerfectSquareSuper
{
  //the nearest perfect square of any negative number or of 0 is 0
  if(number <= 0)
    return 0;

  NSDate *start = [NSDate date];


  float square = number;
  square = pow(square,.5);
  square = (int) (square +.5);

  NSDate *stop = [NSDate date];
  NSTimeInterval runTime = [stop timeIntervalSinceDate:start];
//  NSLog(@"executionTime = %f\n", runTime);
  //(much more efficient - nearly instant for all numbers)
  return pow(square,2);
}

/*
  absVal takes int num and returns the absolute value.
*/
-(int) absVal: (int) num
{
  if(num < 0)
    return -num;
  else
    return num;
}

/*
  terminalSpace prints 3 blank lines in terminal for formatting
*/
-(void) terminalSpace
{
  printf("\n\n\n");
}

@end
