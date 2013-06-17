//
//  ViewController.m
//  AsapPics
//
//  Created by polytech polytech on 09/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import "Inscription.h"
#import "Welcome.h"
#import "Utils.h"
#import "WebServiceManager.h"
#import "SDWebImageRootViewController.h"
#import "User.h"

@implementation Inscription
@synthesize txtNom;
@synthesize txtPrenom;
@synthesize txtLogin;
@synthesize txtPassword;
@synthesize txtMail;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.txtNom.delegate = self;
    txtPrenom.delegate = self;
    txtLogin.delegate = self;
    txtPassword.delegate = self;
    txtMail.delegate = self;
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTxtNom:nil];
    [self setTxtPrenom:nil];
    [self setTxtLogin:nil];
    [self setTxtPassword:nil];
    [self setTxtMail:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)retour:(id)sender {
    Welcome *monViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Welcome"];
    [self.navigationController pushViewController:monViewController animated:YES]; 
}

- (IBAction)inscription:(id)sender {
    if (![Utils connected]){
        [Utils print_simple_popup:@"Inscription" msg:@"Impossible de se connecter au réseau. Veuillez vérifier votre connexion internet"];
    }
    else {
        if([txtNom.text length]==0 || [txtPrenom.text length]==0 || [txtLogin.text length]==0 || [txtMail.text length]==0  || [txtPassword.text length]==0) {
            [Utils print_simple_popup:@"Inscription" msg:@"Veuillez remplir tous les champs"];
        } else {
            //appel au web service échoue
            if(![WebServiceManager add_user:txtLogin.text withPass:txtPassword.text withFName:txtNom.text withMail:txtMail.text withLName:txtPrenom.text ]){
                [Utils print_simple_popup:@"Inscription" msg:@"L'inscription a échouée : login déjà existant"];
            }
            else {
                User* sharedSingleton = [User sharedInstance];
                
                [sharedSingleton setLogin:txtLogin.text];
                [sharedSingleton setIdUser:[WebServiceManager get_user_id:txtLogin.text]];
                
                self.navigationController.navigationBarHidden = false;
                SDWebImageRootViewController *newController = [[SDWebImageRootViewController alloc] init:self];
                [[self navigationController] pushViewController:newController animated:YES];
                [newController release];
            }
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
    if (theTextField == self.txtNom) {
        [txtPrenom becomeFirstResponder];
    }
    else if(theTextField == txtPrenom) {
        [txtLogin becomeFirstResponder];
    }
    else if(theTextField == txtLogin) {
        [txtPassword becomeFirstResponder];
    }
    else if(theTextField == txtPassword) {
        [txtMail becomeFirstResponder];
    }
    else if(theTextField == txtMail) {
        [self inscription:self];
    }
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

@end
