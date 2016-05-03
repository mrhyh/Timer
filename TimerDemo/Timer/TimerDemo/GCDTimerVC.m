//
//  GCDTimerVC.m
//  JX_GCDTimer
//
//  Created by ylgwhyh on 16/5/1.
//  Copyright © 2016年 com.joeyxu. All rights reserved.
//

#import "GCDTimerVC.h"

@interface GCDTimerVC()
/** 定时器(这里不用带*，因为dispatch_source_t就是个类，内部已经包含了*) */
@property (nonatomic, strong) dispatch_source_t threeTimer;
@end

@implementation GCDTimerVC

- (void)viewDidLoad{
    
    //GCD实现定时器方法二
    //2.1执行一次
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //执行事件
        NSLog(@"GCD实现定时器方法二,只执行一次的情况...");
        });
    
    //2.2重复执行
    __block int count = 0;
    
    // 获得队列
    dispatch_queue_t threeQueue = dispatch_get_main_queue();
    //dispatch_queue_t threeQueue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 创建一个定时器(dispatch_source_t本质还是个OC对象)
    self.threeTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, threeQueue);
    
    // 设置定时器的各种属性（几时开始任务，每隔多长时间执行一次）
    // GCD的时间参数，一般是纳秒（1秒 == 10的9次方纳秒）,精确度
    // 何时开始执行第一个任务

    // dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC) 比当前时间晚3秒
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.threeTimer, start, interval, 0);
    
    // 设置回调（ 设置timer执行的事件）
    dispatch_source_set_event_handler(self.threeTimer, ^{
        NSLog(@"------------%@", [NSThread currentThread]);
        count++;
        
        if (count == 4) {
            // 取消定时器
            dispatch_cancel(self.threeTimer);
            self.threeTimer = nil;
        }
    });
    
    // 启动定时器
   dispatch_resume(self.threeTimer);
}

/** *  未封装的GCD定时器调用的方法 */

- (void)doSomethingOfGCD{
    NSLog(@"未封装的GCD定时器调用的方法");
}

@end
