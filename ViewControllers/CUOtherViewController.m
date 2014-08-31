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

@interface CUOtherViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@end

@implementation CUOtherViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.dataLabel.text = [[CUDataDAO selectOtherData].data stringValue];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - action

- (IBAction)changeButtonClicked:(id)sender {
  [CUDataDAO setOtherData:arc4random() % 100];

  self.dataLabel.text = [[CUDataDAO selectOtherData].data stringValue];

  [[NSNotificationCenter defaultCenter] postNotificationName:kCUDataChangedNotification
                                                      object:nil
                                                    userInfo:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
