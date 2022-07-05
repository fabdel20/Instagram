//
//  PostPhotoViewController.h
//  Instagram
//
//  Created by Farida Abdelmoneum on 7/2/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PhotoViewControllerDelegate <NSObject>

-(void)didChooseProfileImage:(UIImageView *) imageView;

@end
@interface PostPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, weak) id<PhotoViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
