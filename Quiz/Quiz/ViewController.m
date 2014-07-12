//
//  ViewController.m
//  Quiz
//
//  Created by Harry Atay on 09/07/2014.
//  Copyright (c) 2014 Harry Atay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *whiteScreen1;
@property (weak, nonatomic) IBOutlet UIImageView *whiteScreen2;
@property (weak, nonatomic) IBOutlet UIImageView *whiteScreen3;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UILabel *wrongLabel;

@end

@implementation ViewController

int score;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_whiteScreen1 setHidden:YES];
    [_whiteScreen2 setHidden:NO];
    [_whiteScreen3 setHidden:NO];
    
    [_rightLabel setHidden:YES];
    [_wrongLabel setHidden:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Question 1 code:

- (IBAction)AnewYorkAnswer:(id)sender {
    
    //THIS ANSWER IS WRONG
    
    [_wrongLabel setHidden:NO];
   
    [_whiteScreen1 setHidden:NO];
    [_whiteScreen2 setHidden:YES];
    
}

- (IBAction)BwashingtonDCAnswer:(id)sender {
    
    //THIS ANSWER IS CORRECT
    
    score = score + 1;
    
    [_wrongLabel setHidden:YES];
    [_rightLabel setHidden:NO];
    
    [_whiteScreen1 setHidden:NO];
    [_whiteScreen2 setHidden:YES];
}

//Question 2 code:

- (IBAction)AyesAnswer:(id)sender {
    
    //THIS ANSWER IS CORRECT
    
    score = score + 1;
    
    [_wrongLabel setHidden:YES];
    [_rightLabel setHidden:NO];
    
    [_whiteScreen2 setHidden:NO];
    [_whiteScreen3 setHidden:YES];
    
}

- (IBAction)BnoAnswer:(id)sender {
    
    //THIS ANSWER IS WRONG
    
    [_rightLabel setHidden:YES];
    [_wrongLabel setHidden:NO];
    
    [_whiteScreen2 setHidden:NO];
    [_whiteScreen3 setHidden:YES];
    
}

//Question 3 code:

- (IBAction)AkgAnswer:(id)sender {
    
    //THIS ANSWER IS WRONG
    
    [_rightLabel setHidden:YES];
    [_wrongLabel setHidden:NO];
    
    [_whiteScreen3 setHidden:NO];
    
    
}

- (IBAction)BnoneAnswer:(id)sender {
    
    //THIS ANSWER IS CORRECT
    
    score = score + 1;
    
    [_wrongLabel setHidden:YES];
    [_rightLabel setHidden:NO];
  
    [_whiteScreen3 setHidden:NO];
    
}

- (IBAction)CkgAnswer:(id)sender {
    
    //THIS ANSWER IS WRONG
    
    [_rightLabel setHidden:YES];
    [_wrongLabel setHidden:NO];
    
    [_whiteScreen3 setHidden:NO];
    
}

//Show my score action:

- (IBAction)showMyScore:(id)sender {
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Your score is: %d", score];
    
    [_rightLabel setHidden:YES];
    [_wrongLabel setHidden:YES];
    
}

//Reset game and start again action:

- (IBAction)resetQuiz:(id)sender {
    
    score = 0;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Your Score Will Apear Here"];
    
    [_rightLabel setHidden:YES];
    [_wrongLabel setHidden:YES];
   
    [_whiteScreen1 setHidden:YES];
    [_whiteScreen2 setHidden:NO];
    [_whiteScreen3 setHidden:NO];
    
}

@end
