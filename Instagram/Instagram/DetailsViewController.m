//
//  DetailsViewController.m
//  Instagram
//
//  Created by Farida Abdelmoneum on 7/5/22.
//

#import "DetailsViewController.h"
//@import Parse;
#import "DateTools.h"

@interface DetailsViewController ()


@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *caption;
@property (strong, nonatomic) IBOutlet UILabel *time;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    [self loadDetailsView];
}


-(void)loadDetailsView{
    self.postImage.layer.cornerRadius = 10;
    self.postImage.layer.borderWidth = 0.05;
    //self.postImage.file = self.post[@"image"];
    //[self.postImage loadInBackground];
    self.usernameLabel.text = self.post[@"author"][@"username"];
    self.caption.text = self.post[@"caption"];
    NSDate *time = self.post.createdAt;
    self.time.text = [time timeAgoSinceNow];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
