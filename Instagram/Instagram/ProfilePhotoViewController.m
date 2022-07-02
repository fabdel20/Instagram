//
//  ProfilePhotoViewController.m
//  Instagram
//
//  Created by Farida Abdelmoneum on 7/2/22.
//

#import "ProfilePhotoViewController.h"
#import "Post.h"
@interface ProfilePhotoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profilePhoto;
- (IBAction)takePhoto:(id)sender;
- (IBAction)uploadPhoto:(id)sender;
- (IBAction)setImage:(id)sender;

@end

@implementation ProfilePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    
    [self.profilePhoto setImage:[self resizeImage:originalImage withSize:CGSizeMake(500, 500)]];
    self.profilePhoto.layer.cornerRadius = 10;
    self.profilePhoto.layer.borderWidth = 0.05;
    
    PFUser *user = [PFUser currentUser];
    user[@"profilePhoto"] = [Post getPFFileFromImage:self.profilePhoto.image];
    [user saveInBackground];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
- (IBAction)setImage:(id)sender {
    if(self.profilePhoto.image){
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

- (IBAction)uploadPhoto:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }

    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
}
@end
