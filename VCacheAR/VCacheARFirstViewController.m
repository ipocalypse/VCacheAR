//
//  VCacheARFirstViewController.m
//  VCacheAR
//
//  Created by Grif on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VCacheARFirstViewController.h"

@implementation VCacheARFirstViewController
@synthesize matureContentLabel;
@synthesize matureContentSwitch;
@synthesize playerNameButton;
@synthesize backButton;
@synthesize enterNameLabel;
@synthesize playerNameTextField;
@synthesize nameConfirmButton;
@synthesize labelRemainingMessages;
@synthesize labelName;
@synthesize labelPlayerName;
@synthesize menuButton;
@synthesize informationButton;
@synthesize optionsButton;
@synthesize labelGeoText;
//@synthesize nameField;
@synthesize matureContentButton;

//Method for saving the name.
/*-(void)saveString:(NSString*)myString

{
    
    
    [[NSUserDefaults standardUserDefaults]
     setObject:myString forKey:@"String"];
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    playerNameButton.hidden = YES;
    matureContentLabel.hidden = YES;
    matureContentButton.hidden = YES;
    matureContentSwitch.hidden = YES;
    backButton.hidden = YES;
    enterNameLabel.hidden = YES;
    playerNameTextField.hidden = YES;
    nameConfirmButton.hidden = YES;
    menuButton.hidden = YES;
    labelName.hidden = YES;
    labelPlayerName.hidden = YES;
    labelRemainingMessages.hidden = YES;
    labelGeoText.alpha = 1;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMatureContentButton:nil];
    [self setMenuButton:nil];
    [self setInformationButton:nil];
    [self setOptionsButton:nil];
    [self setMatureContentLabel:nil];
    [self setMatureContentSwitch:nil];
    [self setPlayerNameButton:nil];
    [self setBackButton:nil];
    [self setEnterNameLabel:nil];
    [self setPlayerNameTextField:nil];
    [self setNameConfirmButton:nil];
    [self setLabelRemainingMessages:nil];
    [self setLabelName:nil];
    [self setLabelPlayerName:nil];
    [self setLabelGeoText:nil];
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

- (void)dealloc {

    [menuButton release];
    [informationButton release];
    [optionsButton release];
    [matureContentLabel release];
    [matureContentSwitch release];
    [playerNameButton release];
    [backButton release];
    [enterNameLabel release];
    [playerNameTextField release];
    [nameConfirmButton release];
    [labelRemainingMessages release];
    [labelName release];
    [labelPlayerName release];
    [labelGeoText release];
    [super dealloc];
}


- (IBAction)optionsMenu:(id)sender {
    
    
    menuButton.hidden = NO;
    optionsButton.hidden = YES;
    informationButton.hidden = YES;
    backButton.hidden = NO;
    matureContentSwitch.hidden = NO;
    matureContentLabel.hidden = NO;
    playerNameButton.hidden = NO;
    labelGeoText.hidden = YES;
    
    NSLog(@"Testing");
    
}

- (IBAction)changePlayerNameButton:(id)sender {

    matureContentSwitch.hidden = YES;
    matureContentLabel.hidden = YES;
    playerNameButton.hidden = YES;
    enterNameLabel.hidden = NO;
    playerNameTextField.hidden = NO;
    nameConfirmButton.hidden = NO;
    
    
}

- (IBAction)MenuButton:(id)sender {
    
    
    menuButton.hidden = YES;
    informationButton.hidden = NO;
    optionsButton.hidden = NO;
    matureContentLabel.hidden = YES;
    matureContentSwitch.hidden = YES;
    playerNameButton.hidden = YES;
    backButton.hidden = YES;
    enterNameLabel.hidden = YES;
    playerNameTextField.hidden = YES;
    nameConfirmButton.hidden = YES;
    labelName.hidden = YES;
    labelPlayerName.hidden = YES;
    labelRemainingMessages.hidden = YES;
    labelGeoText.hidden = NO;
    
}
- (IBAction)nameConfirm:(id)sender {
    
    labelPlayerName.text = playerNameTextField.text;
    [playerNameTextField resignFirstResponder];
}

- (IBAction)informationButton:(id)sender {
    
    
    labelName.hidden = NO;
    labelPlayerName.hidden = NO;
    labelRemainingMessages.hidden = NO;
    menuButton.hidden = NO;
    optionsButton.hidden = YES;
    informationButton.hidden = YES;
    labelGeoText.hidden = YES;
    }



@end
