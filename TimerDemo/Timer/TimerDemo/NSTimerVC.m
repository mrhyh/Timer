//
//  TwoVC.m
//  JX_GCDTimer
//
//  Created by ylgwhyh on 16/4/29.
//  Copyright © 2016年 com.joeyxu. All rights reserved.
//

#import "NSTimerVC.h"

@interface NSTimerVC ()
@property (nonatomic, weak) NSTimer  *timer;
@end

@implementation NSTimerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startDrivingTimer];
    // Do any additional setup after loading the view.
    
}


- (void)startDrivingTimer{
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
//    UIScrollView 拖动时执行的是 UITrackingRunLoopMode，会导致暂停定时器，等恢复为 NSDefaultRunLoopMode 时才恢复定时器。
//    所以如果需要定时器在 UIScrollView 拖动时也不影响的话，建议添加到 UITrackingRunLoopMode 或 NSRunLoopCommonModes 中：
    //n秒后执行testTimerAction方法
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(testTimerAction) userInfo:nil repeats:YES];  //注意关闭重复执行
     [[NSRunLoop mainRunLoop] addTimer:self.timer forMode: UITrackingRunLoopMode];
    //销毁定时器，定时器是加载在系统现成中的，用完了必须销毁，如果是一个临时的界面，可以发送通知调用以下方法销毁定时器.
//    if (self.timer) {
//        [self.timer invalidate];
//        self.timer = nil;
//    }
}

- (void)testTimerAction{
    NSLog(@"NSTimer定时器的方法执行");
}

- (void)dealloc{
    if (self.timer) { //销毁定时器
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
