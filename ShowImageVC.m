//
//  ShowImageVC.m
//  UIScrollViewDemo
//
//  Created by 何华均 on 2017/3/13.
//  Copyright © 2017年 hhj. All rights reserved.
//

#import "ShowImageVC.h"

@interface ShowImageVC ()
{
    UIImageView *iv;
}
@end

@implementation ShowImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"照片详细展示";
    
    self.view.backgroundColor = [UIColor grayColor];
    iv = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 300)];
    iv.image = self.image;
    //iv打开交互
    iv.userInteractionEnabled = YES;
    [self.view addSubview:iv];
    
    //单击放大图片
    UITapGestureRecognizer *tapSingle = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSingle:)];
    tapSingle.numberOfTouchesRequired = 1;
    tapSingle.numberOfTapsRequired = 1;
    [iv addGestureRecognizer:tapSingle];
    
    //放大之后，双击缩小图片
    UITapGestureRecognizer *tapDouble = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDouble:)];
    tapDouble.numberOfTouchesRequired = 1;
    tapDouble.numberOfTapsRequired = 2;
    [iv addGestureRecognizer:tapDouble];
    
    //解决双击的时候也能放大图片bug
    [tapSingle requireGestureRecognizerToFail:tapDouble];
}

- (void)tapSingle:(UITapGestureRecognizer *)tapSingle{
    [UIView animateWithDuration:1 animations:^{
        iv.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

- (void)tapDouble:(UITapGestureRecognizer *)tapSingle{
    [UIView animateWithDuration:1 animations:^{
        iv.frame = CGRectMake(100, 100, 200, 300);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
