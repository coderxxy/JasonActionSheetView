//
//  JasonAcitonSheetViewController.m
//  JasonActionSheetView
//
//  Created by Jason_Xu on 2017/4/27.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "JasonAcitonSheetViewController.h"
#import "XXYActionSheetView.h"

@interface JasonAcitonSheetViewController ()<UITableViewDelegate, UITableViewDataSource, XXYActionSheetViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation JasonAcitonSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    NSArray *operationArr = @[@"代理仿微信删除提示", @"代理无确定操作", @"block演示"];
    [self.dataSource addObjectsFromArray:operationArr];
    //
    [self.view addSubview:self.tableView];
}

/**
 *  懒加载tableview
 *
 *  @return <#return value description#>
 */
- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
    }
    return _tableView;
}
/**
 *  懒加载datasource
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
   static XXYActionSheetView *alertSheetView = nil;
    //
    if (0 == indexPath.row) {
        alertSheetView = [[XXYActionSheetView alloc] initWithTitle:@"您确定要删除此消息" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil];
    }
    //代理
    if (1 == indexPath.row) {
        alertSheetView = [[XXYActionSheetView alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打开相册", @"相机", @"保存到相册", @"我的二维码", @"微信支付", @"支付宝支付", nil];
    }
    //block
    if (2 == indexPath.row) {
        alertSheetView = [[XXYActionSheetView alloc] initWithTitle:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"打开相册", @"相机", @"微信支付", @"支付宝支付"] actionSheetBlock:^(NSInteger index) {
            NSLog(@"block点击的是:%zd", index);
            if (0 == index) {
                
            }
        }];
    }
    //弹出视图
    [alertSheetView xxy_show];
}

#pragma mark - XXYActionSheetViewDelegate
- (void)actionSheet:(XXYActionSheetView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"delegate点击的是:%zd", buttonIndex);
    if (0 == buttonIndex) {//
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
