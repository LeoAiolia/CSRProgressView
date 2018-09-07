//
//  ViewController.m
//  ISRedBlueView
//
//  Created by run on 2018/9/4.
//  Copyright © 2018年 IS. All rights reserved.
//

#import "ViewController.h"
#import "ISChaosEnergyView.h"

@interface ViewController ()

@property(nonatomic, strong) ISChaosEnergyView *redBlueView;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.backgroundColor = [UIColor redColor];
  [button setTitle:@"点击" forState:UIControlStateNormal];
  [button addTarget:self
                action:@selector(buttonClick:)
      forControlEvents:UIControlEventTouchUpInside];
  button.frame = CGRectMake(100, 120, 100, 50);
  [self.view addSubview:button];


  [self.view addSubview:self.redBlueView];
  self.redBlueView.energyScale = 0.5;
  self.redBlueView.leftText = @"我方 15000";
  self.redBlueView.rightText = @"96000 敌方";
  self.redBlueView.centerText = @"战斗结束";
}

- (void)buttonClick:(id)sender {
  static NSInteger i = 0;
  i++;
  
  self.redBlueView.energyScale = (i%11)/10.f;
  self.redBlueView.centerText = [NSString stringWithFormat:@"倒计时：%@s",@(1000*i)];
}

- (ISChaosEnergyView*)redBlueView {
  if (_redBlueView == nil) {
    _redBlueView =
    [[ISChaosEnergyView alloc] initWithFrame:CGRectMake(0, 300, ScreenWidth, 15)];
  }
  return _redBlueView;
}

@end
