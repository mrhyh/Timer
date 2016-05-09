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
    //该方法在那个线程调用，那么run就在哪个线程执行（当前线程），通常是主线程。
    [self performSelector:@selector(testAction) withObject:self afterDelay:3.0];
    
    //在异步函数中执行(如果把该方法放在异步函数中执行，则方法不会被调用（BUG?）)
    dispatch_queue_t queue = dispatch_queue_create("wendingding", 0);
    dispatch_sync(queue, ^{
                 [self performSelector:@selector(test) withObject:nil afterDelay:1.0];
             });
    NSLog(@"异步函数");
}

- (void)testAction{
    NSLog(@"performSelector延迟执行的方法...");
}

-(void)test{
    NSLog(@"异步函数中延迟执行----%@",[NSThread currentThread]);
}

@end
