//
//  ViewController.m
//  testJankin
//
//  Created by BacancyMac-i7 on 19/04/16.
//  Copyright © 2016 BacancyMac-i7. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)reverseString:(NSString *)stringToReverse
{
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[stringToReverse length]];
    [stringToReverse enumerateSubstringsInRange:NSMakeRange(0,[stringToReverse length])
                                        options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                                     usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                         [reversedString appendString:substring];
                                     }];
    return reversedString;
}

- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *result))completion
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2.0f];
        dispatch_sync(dispatch_get_main_queue(), ^{
            completion(@"result");
        });
    });
}

#pragma mark - IBActions

- (IBAction)jumbilifyTapped:(id)sender
{
    self.jumbledLabel.text = [self reverseString:self.txtString.text];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
