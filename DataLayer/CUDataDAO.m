//
//  CUDataDAO.m
//  CUArchitectureDemo
//
//  Created by yuguang on 29/8/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import "CUDataDAO.h"
#import "CUDataModel.h"


static int s_data = 55;
static __strong NSTimer *s_timer = nil;

@implementation CUDataDAO

+ (void)initialize {
//  if (s_timer == nil) {
//    s_timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
//                                               target:self
//                                             selector:@selector(mockProc)
//                                             userInfo:nil
//                                              repeats:YES];
//  }
}

+ (CUDataModel *)selectData {
  CUDataModel *model = [CUDataModel new];
  model.data = @(s_data);
  return model;
}

+ (void)randomData {
  s_data = arc4random() % 1000;
}

+ (void)setData:(int)data {
  if (data != s_data) {
    s_data = data;
  }
}

+ (void)mockProc {
  [CUDataDAO randomData];
}

@end
