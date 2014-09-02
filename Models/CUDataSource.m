//
//  CUDataSource.m
//  CUArchitectureDemo
//
//  Created by yuguang on 2/9/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import "CUDataSource.h"
#import "CUDataModel.h"
#import "CUDataDAO.h"

@interface CUDataSource ()

@property (nonatomic, strong) NSNumber *data;

@end

@implementation CUDataSource

- (instancetype)init {
  if (self = [super init]) {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDataChanged)
                                                 name:kCUDataChangedNotification
                                               object:nil];
    [self updateData];
  }
  
  return self;
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)updateData {
  CUDataModel *dataA = [CUDataDAO selectData];
  CUDataModel *dataOther = [CUDataDAO selectOtherData];
  
  self.data = @([dataA.data intValue] + [dataOther.data intValue]);
}

#pragma mark - notification

- (void)handleDataChanged {
  [self updateData];
}

@end
