//
//  CUMainViewController.m
//  CUArchitectureDemo
//
//  Created by yuguang on 29/8/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import "CUMainViewController.h"
#import "CUDataDAO.h"
#import "CUDataModel.h"
#import "CUDataSource.h"

@interface CUMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) CUDataSource *dataSource;

@end

@implementation CUMainViewController

- (void)awakeFromNib {
  self.dataSource = [CUDataSource new];
  [self.dataSource addObserver:self
                    forKeyPath:@"data"
                       options:NSKeyValueObservingOptionNew
                       context:NULL];
}

- (void)dealloc {
  [self.dataSource removeObserver:self forKeyPath:@"data"];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self updateLabel];
}

- (void)updateLabel {
  self.displayLabel.text = [self.dataSource.data stringValue];
}

#pragma mark - Notification

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (object == self.dataSource && [keyPath isEqualToString:@"data"]) {
    [self updateLabel];
  }
}

@end
