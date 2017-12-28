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
@property(nonatomic, strong)ZXYShineButton *btn1;
@property(nonatomic, strong)ZXYShineButton *btn2;
@property(nonatomic, strong)ZXYShineButton *btn4;
@property(nonatomic, strong)ZXYShineButton *btn3;
@property(nonatomic, strong)ZXYShineButton *btn5;
@property(nonatomic, strong)NSArray *allBtns;
@property(nonatomic, strong)UIButton *allBtn;
@end

@implementation ZXYShineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ZXYShineParams *params1 = [[ZXYShineParams alloc]init];
    params1.bigShineColor = [UIColor colorWithRed:153/255.0 green:152/255.0 blue:38/255.0 alpha:1];
    params1.smallShineColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    self.btn1 = [[ZXYShineButton alloc]initWithFrame:CGRectMake(100, 100, 60, 60) parmas:params1];
    self.btn1.isSelected = YES;
    self.btn1.fillColor = [UIColor colorWithRed:153/255.0 green:152/255.0 blue:38/255.0 alpha:1];
    [self.btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn1];
    
    ZXYShineParams *params2 = [[ZXYShineParams alloc]init];
    params2.bigShineColor = [UIColor colorWithRed:255/255.0 green:95/255.0 blue:89/255.0 alpha:1];
    params2.smallShineColor = [UIColor colorWithRed:216/255.0 green:152/255.0 blue:148/255.0 alpha:1];
    params2.shineCount = 15;
    params2.animDuration = 2;
    params2.smallShineOffsetAngle = -5;
    UIImage *image2 = [ZXYShineImage getImage:Like];
    self.btn2 = [[ZXYShineButton alloc]initWithFrame:CGRectMake(100, 200, 60, 60)];
    self.btn2.image = image2;
    self.btn2.params = params2;
    [self.btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn2];
    
    
    ZXYShineParams *params3 = [[ZXYShineParams alloc]init];
    params3.allowRandomColor = YES;
    params3.animDuration = 1;
    UIImage *image3 = [ZXYShineImage getImage:Smile];
    self.btn3 = [[ZXYShineButton alloc]init];
    self.btn3.frame = CGRectMake(200, 100, 60, 60);
    self.btn3.image = image3;
    self.btn3.params = params3;
    self.btn4.fillColor = [UIColor colorWithRed:1.00 green:0.35 blue:0.13 alpha:1];
    [self.btn3 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn3];
    
    
    ZXYShineParams *params4 = [[ZXYShineParams alloc]init];
    params4.enableFlashing = YES;
    params4.animDuration = 2;
    UIImage *image4 = [ZXYShineImage getImage:Star];
    self.btn4 = [[ZXYShineButton alloc]init];
    self.btn4.frame = CGRectMake(200, 200, 60, 60);
    self.btn4.image = image4;
    self.btn4.params = params4;
    self.btn4.fillColor = [UIColor colorWithRed:0.73 green:0.47 blue:0.66 alpha:1];
    [self.btn4 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn4];
    
    
    ZXYShineParams *params5 = [[ZXYShineParams alloc]init];
    params5.bigShineColor = [UIColor colorWithRed:255/255.0 green:195/255.0  blue:55/255.0  alpha:1];
    
    self.btn5 = [[ZXYShineButton alloc]init];
    self.btn5.frame = CGRectMake(100, 300, 30, 30);
    self.btn5.params = params5;
    self.btn5.norImg = [UIImage imageNamed:@"daily_bottom_collect_nor.png"];
    self.btn5.selImg = [UIImage imageNamed:@"daily_bottom_collect_sel.png"];
    self.btn5.fillColor = [UIColor colorWithRed:1.00 green:0.76 blue:0.29 alpha:1];
    [self.btn5 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn5];
    
    self.allBtn = [[UIButton alloc]init];
    self.allBtn.frame = CGRectMake(100, 400, 60, 30);
    [self.allBtn setTitle:@"allClick" forState:UIControlStateNormal];
    [self.allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.allBtn addTarget:self action:@selector(allClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.allBtn];
    
    self.allBtns = @[self.btn1,self.btn2,self.btn3,self.btn4,self.btn5];
}
-(void)allClick{
    float delay = 0.0;
    
    for (ZXYShineButton *btn in self.allBtns) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [btn setClicked:!btn.isSelected animated:YES];
        });
        
        delay += 0.25;
    }
    
}
-(void)btnClick:(ZXYShineButton *)sender{
    sender.selected = !sender.selected;
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
