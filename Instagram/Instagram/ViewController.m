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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loginUser {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
            /*
             if the login is succesful - send them to the home page
             if it is not suceful, redirect them to another page or error out - idk look at what insta actually does 
             */
        }
    }];
}

@end
