//
//  FeedViewController.m
//  Instagram
//
//  Created by Farida Abdelmoneum on 7/2/22.
//

#import "FeedViewController.h"
#import "ViewController.h"
#import <Parse/Parse.h>
#import "SceneDelegate.h"

@interface FeedViewController ()
- (IBAction)postPhotoButton:(id)sender;

- (IBAction)logoutButton:(id)sender;
@end

@implementation FeedViewController

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

- (IBAction)logoutButton:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if (error)
        {}
        else{
            SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;

            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            sceneDelegate.window.rootViewController = loginViewController;
        }
    }];
}

- (IBAction)postPhotoButton:(id)sender {
    [self performSegueWithIdentifier:@"photoSegue" sender:nil];
}
@end
