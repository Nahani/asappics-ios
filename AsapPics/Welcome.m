//
//  Welcome.m
//  AsapPics
//
//  Created by polytech polytech on 10/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import "Welcome.h"
#import "Inscription.h"
#import "AlbumsViewController.h"
#import "Utils.h"
#import "User.h"
#import "WebServiceManager.h"
#import "Image.h"

@implementation Welcome
@synthesize txt_username;
@synthesize txt_password;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = true;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    txt_username.delegate = self;
    txt_password.delegate = self;
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
}

- (void)viewDidUnload
{
    [self setTxt_username:nil];
    [self setTxt_password:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)tryToConnect:(id)sender {
    if (![Utils connected]){
        [Utils print_simple_popup:@"Connexion" msg:@"Impossible de se connecter au réseau. Veuillez vérifier votre connexion internet"];
    }
    else {
        if([txt_username.text length]==0 || [txt_username.text length]==0 ) {
            [Utils print_simple_popup:@"Connexion" msg:@"Veuillez remplir tous les champs"];
        } else {
            //appel au web service échoue
            if(![WebServiceManager check_password:txt_username.text withPass:txt_password.text]){
                [Utils print_simple_popup:@"Connexion" msg:@"Mauvaise combinaison login/mot de passe"];
            }
            else {
                User* sharedSingleton = [User sharedInstance];
                
                [sharedSingleton setLogin:txt_username.text];
                [sharedSingleton setIdUser:[WebServiceManager get_user_id:txt_username.text]];
                
                NSLog(@"%ld/%@",[sharedSingleton getIdUser], [sharedSingleton getLogin]);
                self.navigationController.navigationBarHidden = false;
                AlbumsViewController *newController = [[AlbumsViewController alloc] init:self];
                [[self navigationController] pushViewController:newController animated:YES];
                [newController release];
            }
        }
    }
}

- (IBAction)move_to_view_subscription:(id)sender {
    NSArray *images = [WebServiceManager get_Images_from_album:1];
    NSLog(@"Id RANDOM : %d", [WebServiceManager get_image_id_random_from_album:1]);
    NSLog(@"Nombre d'album: %d", [[WebServiceManager get_Albums_from_user:5] count]);
    for(Image *img in images){
        NSLog(@"Name: %@, id: %ld, idAlbum: %ld", [img getName], [img getIdImage], [img getIdAlbum]); 
    }
    NSLog(@"coucou");
    Inscription *monViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Subscription"];
    [self.navigationController pushViewController:monViewController animated:YES]; 
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
    if (theTextField == self.txt_username) {
        [txt_password becomeFirstResponder];
    }
    else if(theTextField == self.txt_password) {
        [self tryToConnect:self];
    }
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end
