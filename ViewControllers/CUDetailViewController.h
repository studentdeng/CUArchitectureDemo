//
//  CUDetailViewController.h
//  CUArchitectureDemo
//
//  Created by yuguang on 29/8/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CUDetailViewController;
@protocol CUDetailViewControllerDelegate <NSObject>

- (void)detailVC:(CUDetailViewController *)vc dataChanged:(NSNumber *)data;

@end

@interface CUDetailViewController : UIViewController

@property (nonatomic, weak) id<CUDetailViewControllerDelegate> delegate;

@end
