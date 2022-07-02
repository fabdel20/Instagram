//
//  ViewController.m
//  Instagram
//
//  Created by Farida Abdelmoneum on 6/27/22.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Parse/Parse.h"
#import "HomeViewController.h"
@interface ViewController () <HomeViewControllerDelegate,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"logInSegue"]){
            UINavigationController *navigationController = [segue destinationViewController];
            HomeViewController *homeController = (HomeViewController*)navigationController.topViewController;
            homeController.delegate = self;
        }
    
}
 */
- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
            [self performSegueWithIdentifier:@"NlogInSegue" sender:self];
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
            /*
             if the login is succesful - send them to the home page
             if it is not suceful, redirect them to another page or error out - idk look at what insta actually does 
             */
            [self performSegueWithIdentifier:@"logInSegue" sender:self];
        }
    }];
}

@end
