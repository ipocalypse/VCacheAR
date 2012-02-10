//
//  VCacheARFirstViewController.h
//  VCacheAR
//
//  Created by Grif on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCacheARFirstViewController : UIViewController

//turns mature content filter on/off
@property (retain, nonatomic) IBOutlet UISwitch *matureContentButton;

//confirms name change
//- (IBAction)playerNameButton:(id)sender;



//hidden first:
@property (retain, nonatomic) IBOutlet UILabel *matureContentLabel;
@property (retain, nonatomic) IBOutlet UISwitch *matureContentSwitch;
@property (retain, nonatomic) IBOutlet UIButton *playerNameButton;
@property (retain, nonatomic) IBOutlet UIButton *backButton;
@property (retain, nonatomic) IBOutlet UILabel *enterNameLabel;
@property (retain, nonatomic) IBOutlet UITextField *playerNameTextField;
@property (retain, nonatomic) IBOutlet UIButton *nameConfirmButton;
@property (retain, nonatomic) IBOutlet UILabel *labelRemainingMessages;
@property (retain, nonatomic) IBOutlet UILabel *labelName;
@property (retain, nonatomic) IBOutlet UILabel *labelPlayerName;
//

//player name field
//@property (retain, nonatomic) IBOutlet UITextField *nameField;
- (IBAction)optionsMenu:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *menuButton;
@property (retain, nonatomic) IBOutlet UIButton *informationButton;
@property (retain, nonatomic) IBOutlet UIButton *optionsButton;
@property (retain, nonatomic) IBOutlet UILabel *labelGeoText;

@end
