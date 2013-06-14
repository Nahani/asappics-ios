//
//  ImageView.m
//  AsapPics
//
//  Created by polytech polytech on 10/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import "PhotoChooser.h"

@implementation PhotoChooser
@synthesize label;
@synthesize imageName;
@synthesize editBtn;
@synthesize imageView,choosePhotoBtn, uploadPhotoBtn;

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

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Image upload";
}


-(void)viewWillAppear:(BOOL)animated {
    label.hidden = true;
    imageName.hidden = true;
    editBtn.hidden = true;
}

- (void)viewDidAppear:(BOOL)animated {
    if(imageView.image == nil){
        uploadPhotoBtn.hidden = true;
        uploadPhotoBtn.enabled = false;
        label.hidden = false;
    }
    else{
        uploadPhotoBtn.hidden = false;
        uploadPhotoBtn.enabled = true;
        label.hidden = true;
        imageName.hidden = false;
        editBtn.hidden = false;
    }
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setImageName:nil];
    [self setImageName:nil];
    [self setImageName:nil];
    [self setEditBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) getPhoto:(id) sender {
	UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    
	if((UIButton *) sender == choosePhotoBtn) {
		picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	} else {
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	}
    
	[self presentModalViewController:picker animated:YES];
}


- (IBAction)uploadPhoto:(id)sender {
    NSLog(@"Upload de la photo sous le nom: %@", imageName.text);
}

- (IBAction)editName:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Changer le nom de l'image" message:@"Nom de l'image :" delegate:self cancelButtonTitle:@"Hide" otherButtonTitles:@"ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex > 0) {
        UITextField *textField = [alert textFieldAtIndex:0];
        NSString *text = textField.text; 
        if(text == nil || [text length] == 0) { 
            return; 
        } else { 
            imageName.text = text;
        } 
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissModalViewControllerAnimated:YES];
	imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    NSURL *imagePath = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    
    imageName.text = [imagePath lastPathComponent];
}

- (void)dealloc {
    [label release];
    [imageName release];
    [editBtn release];
    [super dealloc];
}
@end