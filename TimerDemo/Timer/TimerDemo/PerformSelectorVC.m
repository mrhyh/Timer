//
//  PerformSelectorVC.m
//  JX_GCDTimer
//
//  Created by ylgwhyh on 16/5/1.
//  Copyright © 2016年 com.joeyxu. All rights reserved.
//

#import "PerformSelectorVC.h"

@implementation PerformSelectorVC

-(void)viewDidLoad{
    [self performSelector:@selector(testAction) withObject:self afterDelay:3.0];
}

- (void)testAction{
    NSLog(@"performSelector延迟执行的方法...");
}

@end
