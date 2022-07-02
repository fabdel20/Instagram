//
//  ViewController.m
//  Instagram
//
//  Created by Farida Abdelmoneum on 6/27/22.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Parse/Parse.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)logInButton:(id)sender;

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


- (IBAction)logInButton:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    if([username isEqual:@""] || [password isEqual:@""]){
        [self showAlert];
    }else{
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError * error) {
            if(error != nil){
                
            }else{
                [self performSegueWithIdentifier:@"logInSegue" sender:nil];
            }
        }];
    }
}

-(void)showAlert{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing Field(s)" message:@"Enter a username and password" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *tryAgain = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
    [alert addAction:tryAgain];
    [self presentViewController:alert animated:YES completion:^{}];
    
}
@end
