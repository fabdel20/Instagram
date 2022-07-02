//
//  HomeViewController.h
//  Instagram
//
//  Created by Farida Abdelmoneum on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HomeViewControllerDelegate
@end

@interface HomeViewController : UIViewController
@property (nonatomic, weak) id<HomeViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
