//
//  ViewController.m
//  QU!Z
//
//  Created by Harry Atay on 15/07/2014.
//  Copyright (c) 2014 Harry Atay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *questionSixHint;
@property (strong, nonatomic) IBOutlet UIButton *questionSixHintUIButton;
@property (strong, nonatomic) IBOutlet UILabel *levelTwoSceneScoreUILabel;
@property (weak, nonatomic) IBOutlet UIButton *questionTwentyOneHintUIButton;
@property (weak, nonatomic) IBOutlet UILabel *questionTwentyOneHint;
@property (weak, nonatomic) IBOutlet UILabel *questionThirtyHint;
@property (weak, nonatomic) IBOutlet UIButton *questionThirtyHintUIButton;

@end

@implementation ViewController

int score;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_questionSixHint setHidden:YES];
    [_questionTwentyOneHint setHidden:YES];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rightAnswer:(UIButton *)sender {
    
    score  = score + 1;
    
    NSString *rightAnswerString = [NSString stringWithFormat:@"CORRECT! \nYour score is: %d", score];
    
    UIAlertView *rightAlert = [[UIAlertView alloc] initWithTitle:@"Question Summary" message:rightAnswerString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [rightAlert show];
    
}


- (IBAction)wrongAnswer; {
    
    NSString *wrongScoreString = [NSString stringWithFormat:@"Your score is: %d ", score];
    
    UIAlertView *wrongAlertView = [[UIAlertView alloc] initWithTitle:@"GAME OVER"
                                                             message:wrongScoreString
                                                            delegate:self
                                                    cancelButtonTitle:@"Start Over"
                                                    otherButtonTitles:nil];
    [wrongAlertView show];
    
    score = 0;
    
}

-(IBAction)reset; {
    
    NSString *resetString = [NSString stringWithFormat:@"Your final score is: %d", score];
    
    UIAlertView *resetAlert = [[UIAlertView alloc] initWithTitle:@"Home" message:resetString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [resetAlert show];
    
    score = 0;
    
}

-(IBAction)quesionSixHint; {
    
    [_questionSixHint setHidden:NO];
    [_questionSixHintUIButton setHidden:YES];
    
}

- (IBAction)questionTwentyOneHint:(id)sender {
    
    [_questionTwentyOneHint setHidden:NO];
    [_questionTwentyOneHintUIButton setHidden:YES];
    
}

- (IBAction)questionThirtyHint:(id)sender {
    
    [_questionThirtyHint setHidden:NO];
    [_questionThirtyHintUIButton setHidden:YES];
    
}

- (IBAction)wrongAnswerLevelTwo; {
    
    NSString *wrongAnswerLevelTwoString = [NSString stringWithFormat:@"Your score is: %d \nYour going back to Level 2 \nYour score has been reset to 10", score];
    
    UIAlertView *wrongAnswerLevelTwoAlert = [[UIAlertView alloc] initWithTitle:@"GAME OVER" message:wrongAnswerLevelTwoString delegate:self cancelButtonTitle:@"GO BACK" otherButtonTitles:nil];
    
    [wrongAnswerLevelTwoAlert show];
    
    score = 10;
    
}

- (IBAction)wrongAnswerLevelThree; {
    
    NSString *wrongAnswerLevelThreeString = [NSString stringWithFormat:@"Your score is: %d \nYour going back to level 3 \nYour score has been reset to 20", score];
    
    UIAlertView *wrongAnswerLevelThreeAlert = [[UIAlertView alloc] initWithTitle:@"GAME OVER" message:wrongAnswerLevelThreeString delegate:nil cancelButtonTitle:@"GO BACK" otherButtonTitles:nil];
    
    [wrongAnswerLevelThreeAlert show];
    
    score = 20;
    
}

- (IBAction)social:(id)sender {
    
    UIActionSheet *share = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Tweet it", @"Post it on Facebook", nil];
    
    [share showInView:self.view];
    
}

- (IBAction)scoreLevelThree:(id)sender {
    
    UIActionSheet *shareLevelThree = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Tweet it", @"Facebook Post It", nil];
    
    [shareLevelThree showInView:self.view];
    
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
        
        //TWEET SHEET LEVEL ONE
        if (buttonIndex == 0) {
            
            if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
                
                SLComposeViewController *tweetSheetLevelOne = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                
                [tweetSheetLevelOne setInitialText:@"My score is: 10! and I completed Level 1 of the QU!Z app availible on the App Store"];
                
                [self presentViewController:tweetSheetLevelOne animated:YES completion:nil];
                
            }else {
                
                UIAlertView *tweetSheetLevelOneAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"There has been an error \nCheck that you are signed into at least one twitter account in settings" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [tweetSheetLevelOneAlert show];
                
            }
            
            
        }
        
        //FACEBOOK SHEET LEVEL ONE
        if (buttonIndex == 1) {
            
            if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                
                SLComposeViewController *FacebookSheetLevelOne = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                
                [FacebookSheetLevelOne setInitialText:@"My score is: 10! and I completed Level 1 of the QU!Z app availible on the App Store"];
                
                [self presentViewController:FacebookSheetLevelOne animated:YES completion:nil];
                
            }else {
                
                UIAlertView *facebookSheetLevelOneAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"There has been an error \nMake sure you are loged into your facebook account in settings" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [facebookSheetLevelOneAlert show];
                
            }
            
        }
        
        //TWEET SHEET LEVEL TWO
        if (buttonIndex == 3) {
            
            if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
                
                SLComposeViewController *tweetSheetLevelTwo = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                
                [tweetSheetLevelTwo setInitialText:@"My score is: 20! and I completed Level 1 of the QU!Z app availible on the App Store"];
                
                [self presentViewController:tweetSheetLevelTwo animated:YES completion:nil];
                
            }else {
                
                UIAlertView *tweetSheetLevelTwoAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"There has been an error \nMake sure you're signed into at least one twitter account in settings" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [tweetSheetLevelTwoAlert show];
                
            }
            
        }
        
        //FACEBOOK SHEET LEVEL TWO
        if (buttonIndex == 4) {
            
            if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                
                SLComposeViewController *facebookSheetLevelTwo = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                
                [facebookSheetLevelTwo setInitialText:@"My score is: 20! and I completed Level 2 of the QU!Z app availible on the App Store"];
                
                [self presentViewController:facebookSheetLevelTwo animated:YES completion:nil];
                
            }else {
                
                UIAlertView *facebookSheetLevelTwoAlert = [[UIAlertView alloc] initWithTitle:@"ERROR" message:@"There has been an error \nPlease make sure that you are signed into facebook in settings" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [facebookSheetLevelTwoAlert show];
                
            }
            
        }
        
                                
    }
    
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
        
@end
