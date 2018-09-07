//
//  ISChaoEnergyProgressView.m
//  ISRedBlueView
//
//  Created by run on 2018/9/6.
//  Copyright © 2018年 IS. All rights reserved.
//

#import "ISChaoEnergyProgressView.h"
#import "ISChaoEnergyProgressLayer.h"

#define VIEW_LAYER(VIEW) ((ISChaoEnergyProgressLayer *)VIEW.layer)

@implementation ISChaoEnergyProgressView

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    VIEW_LAYER(self).bounds = CGRectMake(0, 0, frame.size.width, frame.size.height);
    VIEW_LAYER(self).layerHeight = 15.f;
  }
  return self;
}

- (void)setProgress:(CGFloat)progress {
  _progress = progress;
  VIEW_LAYER(self).progress = progress;
}

#pragma mark - layer -
+ (Class)layerClass
{
  return [ISChaoEnergyProgressLayer class];
}

@end
