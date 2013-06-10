//
//  Welcome.h
//  AsapPics
//
//  Created by polytech polytech on 10/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Welcome : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txt_username;
@property (strong, nonatomic) IBOutlet UITextField *txt_password;


- (IBAction)tryToConnect:(id)sender;
- (IBAction)move_to_view_subscription:(id)sender;

@end
