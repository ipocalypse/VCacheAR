//
//  VCacheARThirdViewController.m
//  VCacheAR
//
//  Created by Grif on 2/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VCacheARThirdViewController.h"

@implementation VCacheARThirdViewController
@synthesize textFieldEnterName;
@synthesize buttonNameSubmitOutlet;
@synthesize labelName;

-(void)saveString:(NSString*)myString

{
    
    
    [[NSUserDefaults standardUserDefaults]
     setObject:myString forKey:@"String"];
}


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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setTextFieldEnterName:nil];
    [self setButtonNameSubmitOutlet:nil];
    [self setLabelName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [textFieldEnterName release];
    [buttonNameSubmitOutlet release];
    [labelName release];
    [super dealloc];
}
- (IBAction)buttonNameSubmit:(id)sender {

    [textFieldEnterName resignFirstResponder];
    [self saveString:textFieldEnterName.text];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Name confirmation" message:@"Once you have entered your name, it cannot be changed.  Are you sure you want that to be your name?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
                        
                        [alert show];
    
    

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog([NSString stringWithFormat: @"%d", buttonIndex]);
    
    if (buttonIndex == 0)
    {
        [self saveString:textFieldEnterName.text];
        labelName.hidden = YES;
        buttonNameSubmitOutlet.userInteractionEnabled = NO;
        textFieldEnterName.userInteractionEnabled = NO;
        
    }
    
}
@end
