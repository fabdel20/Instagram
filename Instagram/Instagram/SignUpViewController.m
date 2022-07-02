//
//  SignUpViewController.m
//  Instagram
//
//  Created by Farida Abdelmoneum on 6/27/22.
//

#import "SignUpViewController.h"
#import "Parse/Parse.h"
#import "HomeViewController.h"
#import "ViewController.h"
@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *fullnameField;
@property (nonatomic) BOOL filled;
- (IBAction)signUpButton:(id)sender;

@end

@implementation SignUpViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //registerUser();
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"signUpSegue"]){
            UINavigationController *navigationController = [segue destinationViewController];
            ViewController *homeController = (ViewController*)navigationController.topViewController;
            //homeController.delegate = self;
        }
    
}
*/



  

- (IBAction)signUpButton:(id)sender {
    if([self.usernameField.text isEqual:@""] || [self.passwordField.text isEqual:@""]){
        [self showAlert];
    }else{
        PFUser *newUser = [PFUser user];
        
        newUser.username = self.usernameField.text;
        newUser.password = self.passwordField.text;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
            if(error != nil){
            }else{
                [self performSegueWithIdentifier:@"signUpSegue" sender:nil];
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
