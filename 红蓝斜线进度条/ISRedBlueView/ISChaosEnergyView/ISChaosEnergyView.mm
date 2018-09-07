//
//  ISChaosEnergyView.m
//  ISRedBlueView
//
//  Created by run on 2018/9/6.
//  Copyright © 2018年 IS. All rights reserved.
//

#import "ISChaosEnergyView.h"
#import "ISChaoEnergyProgressView.h"

@interface ISChaosEnergyView ()

@property(nonatomic, strong) ISChaoEnergyProgressView* progressView;
@property(nonatomic, strong) UILabel* leftLabel;
@property(nonatomic, strong) UILabel* rightLabel;
@property(nonatomic, strong) UIView* centerBackView;
@property(nonatomic, strong) UILabel* centerLabel;

@end

@implementation ISChaosEnergyView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self initUI];
  }
  return self;
}

#pragma mark - config -
- (void)initUI {
  [self addSubview:self.progressView];
  [self addSubview:self.centerBackView];
  [self addSubview:self.leftLabel];
  [self addSubview:self.centerLabel];
  [self addSubview:self.rightLabel];
}

- (void)layoutSubviews {
  [super layoutSubviews];

  [self.progressView mas_makeConstraints:^(MASConstraintMaker* make) {
    make.left.right.bottom.equalTo(self);
    make.top.equalTo(self);
  }];

  [self.leftLabel
      setContentCompressionResistancePriority:UILayoutPriorityRequired
                                      forAxis:UILayoutConstraintAxisHorizontal];
  [self.leftLabel mas_makeConstraints:^(MASConstraintMaker* make) {
    make.left.equalTo(self).offset(10);
    make.top.bottom.equalTo(self);
    make.width.greaterThanOrEqualTo(@80);
  }];

  [self.rightLabel
      setContentCompressionResistancePriority:UILayoutPriorityRequired
                                      forAxis:UILayoutConstraintAxisHorizontal];
  [self.rightLabel mas_makeConstraints:^(MASConstraintMaker* make) {
    make.right.equalTo(self).offset(-10);
    make.top.bottom.equalTo(self);
    make.width.greaterThanOrEqualTo(@80);
  }];

  [self.centerLabel
      setContentCompressionResistancePriority:UILayoutPriorityRequired
                                      forAxis:UILayoutConstraintAxisHorizontal];
  [self.centerLabel mas_makeConstraints:^(MASConstraintMaker* make) {
    make.centerX.equalTo(self);
    make.centerY.equalTo(self);
    make.height.equalTo(@11);
  }];

  [self.centerBackView mas_makeConstraints:^(MASConstraintMaker* make) {
    make.top.bottom.equalTo(self.centerLabel);
    make.left.equalTo(self.centerLabel.mas_left).offset(-5);
    make.right.equalTo(self.centerLabel.mas_right).offset(5);
  }];
}

#pragma mark - lazy load -

- (ISChaoEnergyProgressView*)progressView {
  if (_progressView == nil) {
    _progressView = [[ISChaoEnergyProgressView alloc] init];
  }
  return _progressView;
}

- (UILabel*)leftLabel {
  if (_leftLabel == nil) {
    _leftLabel = [[UILabel alloc] init];
    _leftLabel.textColor = [UIColor whiteColor];
    _leftLabel.font = [UIFont systemFontOfSize:10];
    _leftLabel.textAlignment = NSTextAlignmentLeft;
  }
  return _leftLabel;
}

- (UILabel*)rightLabel {
  if (_rightLabel == nil) {
    _rightLabel = [[UILabel alloc] init];
    _rightLabel.textColor = [UIColor whiteColor];
    _rightLabel.font = [UIFont systemFontOfSize:10];
    _rightLabel.textAlignment = NSTextAlignmentRight;
  }
  return _rightLabel;
}

- (UILabel*)centerLabel {
  if (_centerLabel == nil) {
    _centerLabel = [[UILabel alloc] init];
    _centerLabel.textColor = [UIColor whiteColor];
    _centerLabel.font = [UIFont systemFontOfSize:10];
    _centerLabel.textAlignment = NSTextAlignmentCenter;
  }
  return _centerLabel;
}

- (UIView*)centerBackView {
  if (_centerBackView == nil) {
    _centerBackView = [[UIView alloc] init];
    _centerBackView.backgroundColor =
        [[UIColor blackColor] colorWithAlphaComponent:0.5];
    _centerBackView.clipsToBounds = YES;
    _centerBackView.layer.cornerRadius = 5.5f;
  }
  return _centerBackView;
}

#pragma mark - set -

- (void)setEnergyScale:(CGFloat)energyScale {
  self.progressView.progress = energyScale;
}

- (void)setLeftText:(NSString*)leftText {
  self.leftLabel.text = leftText;
}

- (void)setRightText:(NSString*)rightText {
  self.rightLabel.text = rightText;
}

- (void)setCenterText:(NSString*)centerText {
  self.centerLabel.text = centerText;
  self.centerBackView.hidden = (centerText.length == 0);
}

#pragma mark - get -
- (CGFloat)energyScale {
  return self.progressView.progress;
}

- (NSString*)leftText {
  return self.leftLabel.text;
}

- (NSString*)rightText {
  return self.rightLabel.text;
}

- (NSString*)centerText {
  return self.centerLabel.text;
}

@end
