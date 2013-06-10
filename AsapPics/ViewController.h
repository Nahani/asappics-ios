//
//  ViewController.h
//  AsapPics
//
//  Created by polytech polytech on 09/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtNom;
@property (weak, nonatomic) IBOutlet UITextField *txtPrenom;
@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtMail;
- (IBAction)retour:(id)sender;
- (IBAction)inscription:(id)sender;

@end
