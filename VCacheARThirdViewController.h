//
//  VCacheARThirdViewController.h
//  VCacheAR
//
//  Created by Grif on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCacheARThirdViewController : UIViewController <UIAlertViewDelegate> 
{
    
}


@property (retain, nonatomic) IBOutlet UITextField *textFieldEnterName;
@property (retain, nonatomic) IBOutlet UIButton *buttonNameSubmitOutlet;
@property (retain, nonatomic) IBOutlet UILabel *labelName;

- (IBAction)buttonNameSubmit:(id)sender;



@end
