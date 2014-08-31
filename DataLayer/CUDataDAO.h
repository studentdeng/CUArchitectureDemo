//
//  CUDataDAO.h
//  CUArchitectureDemo
//
//  Created by yuguang on 29/8/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CUDataModel;
@interface CUDataDAO : NSObject

+ (CUDataModel *)selectData;
+ (void)setData:(int)data;
+ (void)randomData;

+ (CUDataModel *)selectOtherData;
+ (void)setOtherData:(int)data;

@end
