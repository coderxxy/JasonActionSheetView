# JasonActionSheetView
防微信底部操作提示弹框（分别用代理、block实现），轻松调用实现效果。
效果图:
![image](https://github.com/JasonDraem/JasonActionSheetView/blob/master/JasonActionSheetView/ImageSources/01.png)

![image](https://github.com/JasonDraem/JasonActionSheetView/blob/master/JasonActionSheetView/ImageSources/02.png)

![image](https://github.com/JasonDraem/JasonActionSheetView/blob/master/JasonActionSheetView/ImageSources/03.png)

![image](https://github.com/JasonDraem/JasonActionSheetView/blob/master/JasonActionSheetView/ImageSources/05.png)

使用方法
资源文件在JasonAcitonSheetViewUtil文件夹内，导入头文件 #import "XXYActionSheetView.h"
1.若使用代理方式 导入代理 XXYActionSheetViewDelegate

XXYActionSheetView *alertSheetView = [[XXYActionSheetView alloc] initWithTitle:@"您确定要删除此消息" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil];
//弹出视图
[alertSheetView xxy_show];

调用代理方法

#pragma mark - XXYActionSheetViewDelegate
- (void)actionSheet:(XXYActionSheetView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"delegate点击的是:%zd", buttonIndex);
    if (0 == buttonIndex) {//
        
    }
}

2.使用block方式

XXYActionSheetView *alertSheetView = [[XXYActionSheetView alloc] initWithTitle:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@[@"打开相册", @"相机", @"微信支付", @"支付宝支付"] actionSheetBlock:^(NSInteger index) {
            NSLog(@"block点击的是:%zd", index);
            if (0 == index) {
                
            }
        }];
 //弹出视图
 [alertSheetView xxy_show];






