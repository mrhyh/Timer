//
//  ViewController.m
//  TestForCancelPrePerformReq
//
//  Created by samuel on 13-5-30.
//  Copyright (c) 2013年 samuel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnModelInCurrViewTouchupInside:(id)sender {
    [self performSelector:@selector(didRuninCurrModel:) withObject:[NSNumber numberWithBool:YES] afterDelay:3.0f];
    
    [self performSelector:@selector(didRuninCurrModelNoArgument) withObject:nil afterDelay:3.0f];
    
    NSLog(@"Test start....");
}

- (IBAction)cancelRun:(id)sender {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didRuninCurrModel:) object:[NSNumber numberWithBool:YES]];//true
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didRuninCurrModel:) object:[NSNumber numberWithBool:NO]];//false
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didRuninCurrModel:) object:nil];//false
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didRuninCurrModelNoArgumentTest) object:nil];//true
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];//all ok
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
}

- (void)didRuninCurrModel:(NSNumber *)numFin
{
    NSLog(@"- (void)didRuninCurrModel:%@", numFin.boolValue ? @"YES":@"NO");
}

- (void)didRuninCurrModelNoArgument
{
    NSLog(@"- (void)didRuninCurrModelNoArgument");
}

- (void)didRuninCurrModelNoArgumentTest{
    NSLog(@"取消代码。。。");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
