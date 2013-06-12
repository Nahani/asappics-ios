//
//  SDWebImageRootViewController.m
//  Sample
//
//  Created by Kirby Turner on 3/18/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "SDWebImageRootViewController.h"
#import "SDWebImageDataSource.h"
#import "PhotoChooser.h"
#import "Welcome.h"


@interface SDWebImageRootViewController ()
- (void)showActivityIndicator;
- (void)hideActivityIndicator;
@end

@implementation SDWebImageRootViewController

- (void)dealloc 
{
   [activityIndicatorView_ release], activityIndicatorView_ = nil;
   [images_ release], images_ = nil;
   [super dealloc];
}

- (id)init: (Welcome *) welcome {
    self = [super init];
    if(self) {
        welcomeView = welcome;
        NSLog(@"Coucou");
    }
    
    return self;
}

- (void)viewDidLoad 
{
   [super viewDidLoad];
   self.title = @"Nom de l'album";
    navController = [[UINavigationController alloc] init];
    [window_ addSubview:navController.view];
    // Override point for customization after application launch.
    [window_ makeKeyAndVisible];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(print_Message)];
   images_ = [[SDWebImageDataSource alloc] init];
   [self setDataSource:images_];
}

-(void)print_Message {
    NSLog(@"Eh up, someone just pressed the button!");
    //PhotoChooser *monViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoChooser"];
    
    
    //PhotoChooser *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PhotoChooser"];
    
    //PhotoChooser *newController = [[PhotoChooser alloc] init];
    //[self.navigationController pushViewController:chooser animated:YES];
    
    PhotoChooser *monViewController = [welcomeView.storyboard instantiateViewControllerWithIdentifier:@"PhotoChooser"];
    [welcomeView.navigationController pushViewController:monViewController animated:YES]; 
    
    
//  [self presentViewController:detailVC animated:YES completion:nil];
    //[chooser release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning 
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)willLoadThumbs 
{
   [self showActivityIndicator];
}

- (void)didLoadThumbs 
{
   [self hideActivityIndicator];
}


#pragma mark -
#pragma mark Activity Indicator

- (UIActivityIndicatorView *)activityIndicator 
{
   if (activityIndicatorView_) {
      return activityIndicatorView_;
   }

   activityIndicatorView_ = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
   CGPoint center = [[self view] center];
   [activityIndicatorView_ setCenter:center];
   [activityIndicatorView_ setHidesWhenStopped:YES];
   [activityIndicatorView_ startAnimating];
   [[self view] addSubview:activityIndicatorView_];
   
   return activityIndicatorView_;
}

- (void)showActivityIndicator 
{
   [[self activityIndicator] startAnimating];
}

- (void)hideActivityIndicator 
{
   [[self activityIndicator] stopAnimating];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    navController = [[UINavigationController alloc] init];
    [window_ addSubview:navController.view];
    // Override point for customization after application launch.
    [window_ makeKeyAndVisible];
    NSLog(@"Test");
    
    return YES;
}



@end
