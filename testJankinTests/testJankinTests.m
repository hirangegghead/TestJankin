//
//  testJankinTests.m
//  testJankinTests
//
//  Created by BacancyMac-i7 on 19/04/16.
//  Copyright © 2016 BacancyMac-i7. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface testJankinTests : XCTestCase
@property (nonatomic) testJankinTests *vcToTest;
@end

@interface testJankinTests (Test)

- (NSString *)reverseString:(NSString *)stringToReverse;
- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *))completion;

@end
@implementation testJankinTests

- (void)setUp {
    [super setUp];
    self.vcToTest = [[ViewController alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
- (void)testReverseString
{
    NSString *originalString = @"himynameisandy";
    NSString *reversedString = [self.vcToTest reverseString:originalString];
    NSString *expectedReversedString = @"ydnasiemanymih";
    XCTAssertEqualObjects(expectedReversedString, reversedString, @"The reversed string did not match the expected reverse");
}

- (void)testPerformanceReverseString
{
    NSString *originalString = @"himynameisandy";
    [self measureBlock:^{
        [self.vcToTest reverseString:originalString];
    }];
}

- (void)testDoSomethingThatTakesSomeTime
{
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Long method"];
    [self.vcToTest doSomethingThatTakesSomeTimesWithCompletionBlock:^(NSString *result) {
        XCTAssertEqualObjects(@"result", result, @"Result was not correct!");
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
