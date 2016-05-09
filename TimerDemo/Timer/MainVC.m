

//
//  MainVC.m
//  JX_GCDTimer
//
//  Created by ylgwhyh on 16/4/30.
//  Copyright © 2016年 com.joeyxu. All rights reserved.
//

#import "MainVC.h"
#import "NSTimerVC.h"
#import "PerformSelectorVC.h"
#import "GCDTimerVC.h"
#import "CADisplayLinkVC.h"

@interface MainVC () <UITableViewDataSource, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@property (strong, nonatomic) NSMutableArray *nameMutableArray;
@end

@implementation MainVC

- (void)setNameMutableArray:(NSMutableArray *)nameMutableArray{
    if(_nameMutableArray == nil){
        _nameMutableArray = [[NSMutableArray alloc] init];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //由于此方法调用十分频繁，cell的标示声明成静态变量有利于性能优化
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey";
    //首先根据标识去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //如果缓存池没有到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    if(indexPath.row == 0){
         cell.textLabel.text=@"封装好的GCD定时器";
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"NSTimer定时器";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"performSelector";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"未封装的GCD的timer定时器";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"CADisplayLink";
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        CustomTimerVC *next = [[CustomTimerVC alloc] init];
        [self.navigationController pushViewController:next animated:YES];
    }else if(indexPath.row == 1){
        NSTimerVC *next = [[NSTimerVC alloc] init];
        [self.navigationController pushViewController:next  animated:YES];
    }else if(indexPath.row == 2){
        PerformSelectorVC *next = [[PerformSelectorVC alloc] init];
        [self.navigationController pushViewController:next  animated:YES];
    }else if(indexPath.row == 3){
        GCDTimerVC *next = [[GCDTimerVC alloc] init];
        [self.navigationController pushViewController:next  animated:YES];
    }else if(indexPath.row == 4){
        CADisplayLinkVC *next = [[CADisplayLinkVC alloc] init];
        [self.navigationController pushViewController:next  animated:YES];
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

@end
