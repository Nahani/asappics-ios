//
//  ViewController.m
//  AsapPics
//
//  Created by polytech polytech on 09/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import "ViewController.h"
#import "Welcome.h"

@implementation ViewController
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
    NSLog(@"Inscription !");
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    NSLog(@"Ok");
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
