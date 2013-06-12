//
//  ViewController.h
//  AsapPics
//
//  Created by polytech polytech on 09/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Inscription : UIViewController <UITextFieldDelegate>
@property IBOutlet UITextField *txtNom;
@property IBOutlet UITextField *txtPrenom;
@property IBOutlet UITextField *txtLogin;
@property IBOutlet UITextField *txtPassword;
@property IBOutlet UITextField *txtMail;
- (IBAction)retour:(id)sender;
- (IBAction)inscription:(id)sender;

@end
