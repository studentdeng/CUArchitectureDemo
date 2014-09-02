//
//  CUDetailViewController.m
//  CUArchitectureDemo
//
//  Created by yuguang on 29/8/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import "CUDetailViewController.h"
#import "CUDataDAO.h"
#import "CUDataModel.h"
#import "CUDataSource.h"

@interface CUDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) CUDataSource *dataSource;
@end

@implementation CUDetailViewController

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

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)updateLabel {
  self.displayLabel.text = [self.dataSource.data stringValue];
}

#pragma mark - action

- (IBAction)changeButtonClicked:(id)sender {
  int value = arc4random() % 100;
  [CUDataDAO setData:value];
  [[NSNotificationCenter defaultCenter] postNotificationName:kCUDataChangedNotification
                                                      object:nil
                                                    userInfo:nil];
}

#pragma mark - Notification

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
  if (object == self.dataSource && [keyPath isEqualToString:@"data"]) {
    [self updateLabel];
  }
}

@end
