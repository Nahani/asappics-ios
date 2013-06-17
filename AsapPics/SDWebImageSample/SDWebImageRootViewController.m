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
#import "WebServiceManager.h"


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

- (id)init: (Welcome *) welcome : (long) album {
    self = [super init:false : welcome];
    if(self) {
        idAlbum = album;
    }
    
    return self;
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self viewDidLoad];
    [activityIndicatorView_ setNeedsDisplay];
}

- (void)viewDidLoad 
{
   [super viewDidLoad];
    self.title = [WebServiceManager get_album_name:idAlbum];
    // Override point for customization after application launch.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addImage)];
    //-------------------------------------------------------------
    //Faire un constructeur ou l'on passe l'id de l'idAlbum
    //Si pas de param alors c'est la vue des album
   images_ = [[SDWebImageDataSource alloc] init:idAlbum];
   [self setDataSource:images_];
}

-(void)addImage {
    PhotoChooser *monViewController = [welcomeView.storyboard instantiateViewControllerWithIdentifier:@"PhotoChooser"];
    [monViewController setIdAlbum:idAlbum];
    [welcomeView.navigationController pushViewController:monViewController animated:YES]; 
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
    // Override point for customization after application launch.
    NSLog(@"Test");
    
    return YES;
}

-(void) deleteAtIndex:(NSInteger) idDel {
    indexImage = idDel;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Supprimer une photo" message:@"Voulez-vous vraiment supprimer la photo ?" delegate:self cancelButtonTitle:@"Non" otherButtonTitles:@"Oui", nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex {
        if(buttonIndex > 0) {
            [images_ deleteImageAtIndex:indexImage];
            [self viewDidLoad];
        }
}




@end
