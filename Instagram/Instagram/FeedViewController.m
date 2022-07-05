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
#import "PostPhotoViewController.h"
#import "Post.h"
#import "DetailsViewController.h"
#import "InstaViewCell.h"

@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *postArray;
@property (strong,nonatomic) UIRefreshControl *refreshControl;
- (IBAction)postPhotoButton:(id)sender;

- (IBAction)logoutButton:(id)sender;
@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self fetchPosts];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex:0];
}

-(void)fetchPosts{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query includeKey:@"author"];
    [query includeKey:@"createdAt"];
    query.limit = 20;

    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.postArray = posts;
            [self.refreshControl endRefreshing];
            [self.tableView reloadData];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"DetailsViewController"]){
        UITableViewCell *instaCell = sender;
        NSIndexPath *myIndexPath = [self.tableView indexPathForCell:instaCell];
        // Pass the selected object to the new view controller.
        Post *igPost = self.postArray[myIndexPath.row];
        DetailsViewController *detailsController = [segue destinationViewController];
        detailsController.post = igPost;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.postArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    InstaViewCell *instaCell = [self.tableView dequeueReusableCellWithIdentifier:@"InstaCell"];
    
    Post *post = self.postArray[indexPath.row];
    
    instaCell.usernameLabel.text = post[@"author"][@"username"];
    instaCell.commentUsername.text = post[@"author"][@"username"];
    instaCell.comment.text = post[@"caption"];
    instaCell.postImage.layer.cornerRadius = 10;
    instaCell.postImage.layer.borderWidth = 0.05;
    //instaCell.postImage.file = post[@"image"];
    //[instaCell.postImage loadInBackground];

    return instaCell;
}

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
