//
//  ViewController.m
//  UIScrollViewDemo
//
//  Created by 何华均 on 2017/3/12.
//  Copyright © 2017年 hhj. All rights reserved.
//

#import "ViewController.h"
#import "ShowImageVC.h"

#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height


@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"照片墙";
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor grayColor];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,Screen_Width,Screen_Height)];
    self.scrollView.contentSize = CGSizeMake(Screen_Width, Screen_Height*11);
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    //加载图片
    for(int i = 0; i < 10; i++){
        NSString *strImageName = [NSString stringWithFormat:@"17_%d.jpg",i+1];
//        //imageNamed读取图片，一直占用内存空间
//        UIImage *imge = [UIImage imageNamed:strImageName];
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *resourcePath = [bundle resourcePath];
        NSString *filePath = [resourcePath stringByAppendingPathComponent:strImageName];
        //imageWithContentsOfFile 来读取图片的话，占用空间比较小，不过路径要注意
        UIImage *imge = [UIImage imageWithContentsOfFile:filePath];
        
//        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, Screen_Height*(i-1), Screen_Width,Screen_Height)]; //图片竖向滚动
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(10+(i%3)*110, 10+(i/3)*210, 100,200)];//照片墙效果
        iv.image = imge;
        iv.userInteractionEnabled = YES;
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressTap:)];
        [iv addGestureRecognizer:tap];
        [self.scrollView addSubview:iv];
    }
}

- (void)pressTap:(UITapGestureRecognizer *)tap{
    UIImageView *iv = (UIImageView *)tap.view;
    ShowImageVC *vc = [[ShowImageVC alloc]init];
    vc.image = iv.image;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma marks- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollView.contentOffset.y----%f",scrollView.contentOffset.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
