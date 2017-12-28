//
//  ZXYShineViewController.m
//  xingxing
//
//  Created by develop5 on 2017/12/27.
//  Copyright © 2017年 yiqihi. All rights reserved.
//
/****
-----------------------注释是给白痴的人写的-----------------
* *
 */
#import "ZXYShineViewController.h"
#import "ZXYShine.h"

@interface ZXYShineViewController ()

@end

@implementation ZXYShineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor =  [UIColor whiteColor];
    
    ZXYShineParams *param1 = [[ZXYShineParams alloc]init];
    param1.bigShineColor = [UIColor colorWithRed:153/255.0 green:152/255.0 blue:38/255.0 alpha:1];
    param1.smallShineColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    param1.animDuration = 1;
    ZXYShineButton *button = [[ZXYShineButton alloc]initWithFrame:CGRectMake(100,100 , 30, 30) parmas:param1];
    button.norImg = [UIImage imageNamed:@"list_like@2x"];
    button.selImg = [UIImage imageNamed:@"list_like_selected@2x"];
    [button addTarget:self action:@selector(shineButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)shineButtonClick:(UIControl *)sender {
    sender.selected = sender;
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
