//
//  ViewController.m
//  Test
//
//  Created by Dipankar Ghosh on 3/28/18.
//  Copyright © 2018 Dipankar Ghosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
int n=0;
@implementation ViewController
@synthesize label,text,text2;
@synthesize label2;
@synthesize label3,label4,label5,Label6;
int count= 0;
int flag= 0;
int occur= 0;

-(BOOL) Contain: (NSString *)Text on:(NSString *)Text2
{
    return [Text2 rangeOfString:Text
                        options:NSCaseInsensitiveSearch].location != NSNotFound;
}
-(BOOL)isAlphaNumericOnly:(NSString *)input
{
    NSString *alphaNum = @"[a-zA-Z0-9]+";
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", alphaNum];
    
    return [regexTest evaluateWithObject:input];
}

-(BOOL) validateAlphabets: (NSString *)alpha
{
    NSString *abnRegex = @"^[a-zA-Z0-9]*$"; // check for one or more occurrence of string you can also use * instead + for ignoring null value
    NSPredicate *abnTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", abnRegex];
    BOOL isValid = [abnTest evaluateWithObject:alpha];
    return isValid;
}

- (IBAction)submittext:(id)sender {
     bool checktext = [self isAlphaNumericOnly:text.text];
    if(!checktext)
    {
        label4.text=@"Text is not alphanumeric.";
        NSLog(@"Text is not alpha");
    }
    else
    {
        label4.text=@"Text is alphanumeric !";
        NSLog(@"Text is alpha");
    }
    
}

- (IBAction)submit:(id)sender {
    NSString * input = text.text;
   // NSString * input2 = text2.text;
    NSLog(@"%@", input);
    bool checkPhrase = [self validateAlphabets:text2.text];
    
    if(!checkPhrase)
    {
        label3.text = @"Phrase is not alphanumeric";
        NSLog(@"Phrase does Not Match");
    }
    else
    {
        label3.text = @"Phrase is alphanumeric !";
        NSLog(@"Phrase does Match");
    }
    
  
}

- (IBAction)sub:(id)sender {
   // bool exist = [self Contains:text2.text];
 //bool exist = [self Contain:text2 on:text];
    
    
  //NSString *Text = [text text];
    NSString *Text2 = [text2 text];
    
    NSLog(@"%@", Text2);
    Text2 = [Text2 stringByReplacingOccurrencesOfString:@", " withString:@"|"];
    NSArray *wordArray = [Text2 componentsSeparatedByString:@" "];
    NSMutableArray *finalArray = [NSMutableArray array];
    for (NSString __strong *Text2 in wordArray)
    {
        Text2 = [Text2 stringByReplacingOccurrencesOfString:@"|" withString:@" "];
        [finalArray addObject:Text2];
        count = count+1;
        NSLog(@"%d",count);
    }
    NSLog(@"finalArray = %@", finalArray);
    NSLog(@"finalArray element 1 = %@", finalArray[0]); // Hello is being printed here
    NSLog(@"finalArray element 2 = %@", finalArray[1]); // World is being printed here
    NSLog(@"Value of final count -> %d",count);
    flag=0;
    while(n<count)
    {
        flag=0;
        if([text.text isEqualToString:finalArray[n]])
        {
        flag=flag+1;
        NSLog(@"Text that matched is -> %@", finalArray[n]);
        label5.text =[NSString stringWithFormat:@"%@", finalArray[n]];
        occur = occur + 1;
        Label6.text =[NSString stringWithFormat:@"%d", occur];
        NSLog(@"Value of occur -> %d",occur);
        NSLog(@"Value of flag -> %d",flag);
        }
        else
        {
        NSLog(@"Value of else flag -> %d",flag);
     
        }
        
      n=n+1;
    }
   //  if([text2.text isEqualToString:text.text])
   /* if(!exist)
    {
    NSLog(@"Exists");
    }
    else
    {
      //_label5.text = @"Text does not exist";
      NSLog(@" Does not Exist");
    }
    */
    
[finalArray removeAllObjects];

}

- (IBAction)reset:(id)sender
{
    int reset=0;
    count = 0;
    n=0;
    occur=0;
    Label6.text =[NSString stringWithFormat:@"%d", reset];
     NSLog(@"Value of **count -> %d",count);
     NSLog(@"Value of **n-> %d",n);
    text2.text = NULL;
    text.text = NULL;
    label5.text = NULL;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
