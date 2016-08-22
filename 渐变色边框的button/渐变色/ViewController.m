//
//  ViewController.m
//  渐变色
//
//  Created by WuChunlong on 16/8/19.
//  Copyright © 2016年 WuChunlong. All rights reserved.
//

#import "ViewController.h"
#import "CAGradientButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self test1];
    [self test2];
    [self test3];

}



/**
 *  添加一个边框颜色渐变的button: 方法三
 */
- (void)test3 {
   
    CAGradientButton *btn = [CAGradientButton buttonWithFrame:CGRectMake(50, 450, 250, 40) borderColors:@[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor]] borderWidth:3 addToParentView:self.view action:^(CAGradientButton *button) {
        
        NSLog(@"%s, line = %d, tag = %ld", __PRETTY_FUNCTION__, __LINE__, button.tag);
    }];
    
    btn.backgroundColor = [UIColor yellowColor];
    [btn setTitle:@"有种别点我" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.tag = 3;
}


/**
 *  添加一个边框颜色渐变的button: 方法二
 */
- (void)test2 {
    NSArray *colors = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor]];
    CAGradientButton *btn = [CAGradientButton buttonWithFrame:CGRectMake(50, 250, 250, 40) borderColors:colors borderWidth:3 addToParentView:self.view];
    btn.backgroundColor = [UIColor greenColor];
    btn.tag = 2;
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}


/**
 *  添加一个边框颜色渐变的button: 方法一
 */
- (void)test1 {
    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake(50, 50, 250, 60);
    backView.backgroundColor = [UIColor clearColor];
    backView.layer.cornerRadius = 60 * 0.5;
    //    backView.layer.borderWidth = 3;
    //    backView.layer.borderColor = [UIColor clearColor].CGColor;
    backView.layer.masksToBounds = YES;
    
    [self.view addSubview:backView];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = backView.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor], (id)[[UIColor orangeColor] CGColor], (id)[[UIColor yellowColor] CGColor],(id)[[UIColor greenColor] CGColor],(id)[[UIColor blueColor] CGColor],nil];
    
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 0);
    
    [backView.layer insertSublayer:gradient atIndex:0];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(5, 5, 240, 50);
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitle:@"fuck me baby!" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:22];
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.cornerRadius = 50 * 0.5;
    [backView addSubview:btn];
    
    btn.tag = 1;
    [btn addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)onBtnClick:(UIButton *)btn {
    NSLog(@"%s, line = %d, tag = %ld", __PRETTY_FUNCTION__, __LINE__, btn.tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
