//
//  InstaViewCell.h
//  Instagram
//
//  Created by Farida Abdelmoneum on 7/5/22.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface InstaViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *comment;
@property (strong, nonatomic) IBOutlet UILabel *commentUsername;

@end

NS_ASSUME_NONNULL_END
