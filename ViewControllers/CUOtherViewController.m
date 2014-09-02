//
//  CUOtherViewController.m
//  CUArchitectureDemo
//
//  Created by yuguang on 29/8/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import "CUOtherViewController.h"
#import "CUDataDAO.h"
#import "CUDataModel.h"
#import "CUDataSource.h"

@interface CUOtherViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) CUDataSource *dataSource;

@end

@implementation CUOtherViewController

- (void)awakeFromNib {
  self.dataSource = [CUDataSource new];
  [self.dataSource addObserver:self
                    forKeyPath:@"data"
                       options:NSKeyValueObservingOptionNew
                       context:NULL];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self updateLabel];
}

- (void)updateLabel {
  self.dataLabel.text = [self.dataSource.data stringValue];
}

#pragma mark - action

- (IBAction)changeButtonClicked:(id)sender {
  [CUDataDAO setOtherData:arc4random() % 100];

  [[NSNotificationCenter defaultCenter] postNotificationName:kCUDataChangedNotification
                                                      object:nil
                                                    userInfo:nil];
}

#pragma mark - notification

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (object == self.dataSource && [keyPath isEqualToString:@"data"]) {
    [self updateLabel];
  }
}

@end
