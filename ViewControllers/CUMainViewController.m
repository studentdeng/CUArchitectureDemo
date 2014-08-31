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
#import "CUDetailViewController.h"

@interface CUMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) CUDetailViewController *vc;
@end

@implementation CUMainViewController

- (void)awakeFromNib {
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(handleDataChangedNotification)
                                               name:kCUDataChangedNotification
                                             object:nil];
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self updateLabel];
}

- (void)updateLabel {
  int dataB = [[CUDataDAO selectData].data intValue];
  int dataC = [[CUDataDAO selectOtherData].data intValue];
  
  self.displayLabel.text = [@(dataB + dataC) stringValue];
}

#pragma mark - Notification

- (void)handleDataChangedNotification {
  [self updateLabel];
  [self.vc updateLabel];
}

//// fix data inconsistenly
//- (void)viewWillAppear:(BOOL)animated {
//  [super viewWillAppear:animated];
//  
//  self.displayLabel.text = [[CUDataDAO selectData].data stringValue];
//}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"push"]) {
    CUDetailViewController *vc = [segue destinationViewController];
    if ([vc isKindOfClass:[CUDetailViewController class]]) {
      self.vc = vc;
    }
  }
}

//#pragma mark - CUDetailViewControllerDelegate
//
//- (void)detailVC:(CUDetailViewController *)vc dataChanged:(NSNumber *)data {
//  self.displayLabel.text = [data stringValue];
//}


@end
