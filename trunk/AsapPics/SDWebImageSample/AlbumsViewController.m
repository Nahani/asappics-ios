//
//  SDWebImageRootViewController.m
//  Sample
//
//  Created by Kirby Turner on 3/18/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//
//

//------------ Longue clique sur les KTThumbView pour delete un album ou image

#import "AlbumsViewController.h"
#import "AlbumsDataSource.h"
#import "PhotoChooser.h"
#import "Welcome.h"
#import "User.h"
#import "WebServiceManager.h"
#import "Utils.h"


@interface AlbumsViewController ()
- (void)showActivityIndicator;
- (void)hideActivityIndicator;
@end

@implementation AlbumsViewController

- (void)dealloc 
{
    [activityIndicatorView_ release], activityIndicatorView_ = nil;
    [albums release], albums = nil;
    [super dealloc];
}

- (id)init: (Welcome *) welcome {
    self = [super init:true : welcome];
    if(self) {
        alertAdd = [[UIAlertView alloc] initWithTitle:@"Creer un album" message:@"Nom du nouvel album :" delegate:self cancelButtonTitle:@"Hide" otherButtonTitles:@"ok", nil];
        alertAdd.alertViewStyle = UIAlertViewStylePlainTextInput;
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
    self.title = [@"Albums de " stringByAppendingString:[[User sharedInstance] getLogin]];
    // Override point for customization after application launch.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAlbum)];
    //-------------------------------------------------------------
    //Faire un constructeur ou l'on passe l'id de l'idAlbum
    //Si pas de param alors c'est la vue des album
    albums = [[AlbumsDataSource alloc] init:[[User sharedInstance] getIdUser]];
    [self setDataSource:albums];
}

-(void)addAlbum {
    
    [alertAdd show];
}

- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(alert == alertAdd){
        if(buttonIndex > 0) {
            UITextField *textField = [alert textFieldAtIndex:0];
            NSString *text = textField.text; 
            if(text == nil || [text length] == 0) { 
                return; 
            } else { 
                if(![WebServiceManager add_album:[[User sharedInstance] getIdUser] withName:text])
                {
                    [Utils print_simple_popup:@"Ajout d'un album" msg:@"Erreur : album déjà existant"];
                    [textField setText:@""];
                } else {
                    [self viewDidLoad];
                }
            } 
        }
    }
    else{
        if(buttonIndex > 0) {
            [albums deleteImageAtIndex:indexAlbum];
            [self viewDidLoad];
        }
    }
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
    
    return YES;
}

-(void) deleteAtIndex:(NSInteger) idDel {
    indexAlbum = idDel;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Supprimer un album" message:@"Voulez vraiment supprimer l'album ?" delegate:self cancelButtonTitle:@"Non" otherButtonTitles:@"Oui", nil];
    [alert show];
    
}




@end
